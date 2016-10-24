class MarqueController < ApplicationController
  def show
    @sectionclassadd = ''
    @statuts = Statut.all.order("mar_sta_lib_tx")
    @types = Type.all.order("mar_typ_lib_tx")
    @secteurs = Secteur.all.order("mar_sec_lib_tx")
    @pays = Pays.all.order("mar_pays_lib_tx")
  end

  def new
    @sectionclassadd = ' creation'
    @showmarquebuttons = true
    @statutsjuridiques = StatutJuridique.all.order("mar_sta_jur_lib_tx")
    @statuts = Statut.all.order("mar_sta_lib_tx")
    @types = Type.all.order("mar_typ_lib_tx")
    @secteurs = Secteur.all.order("mar_sec_lib_tx")
    @pays = Pays.all.order("mar_pays_lib_tx")
    @contacts_acheteurs = []
    @contacts_marque = []
    @contacts_allies = []
    # @marquelogosrc = ActionController::Base.helpers.asset_path('ico_img_normal.png')
    @marquelogosrc = ''
    @current_user_email = User.find(session[:user_id])["email"]
    @current_contact = Contact.find_by(cont_contacts_mail_tx: @current_user_email)
  end

  def list
    @marques = Marque.all
    @liensContact = LiensContactMarque.all
    @contacts = Contact.all
  end

  def addcontact
    @marque_id = params[:marque]
    @marque = Marque.find(@marque_id)
    @sectionclassadd = ' proprietaire'
    @showmarquebuttons = true
  end

  def edit
    @marque_id = params[:id]
    @marque = Marque.find(@marque_id)
    if @marque.mar_marques_maj_user_tx == session[:user_id].to_s
      @sectionclassadd = ' proprietaire'
    end
    @showmarquebuttons = true
    @statutsjuridiques = StatutJuridique.all.order("mar_sta_jur_lib_tx")
    @statuts = Statut.all.order("mar_sta_lib_tx")
    @types = Type.all.order("mar_typ_lib_tx")
    @secteurs = Secteur.all.order("mar_sec_lib_tx")
    @pays = Pays.all.order("mar_pays_lib_tx")
    # TODO : remplacer boucle par une vue +++++++++++
    @lienscontactsmarquesAcheteurs = LiensContactMarque.where("mar_marques_ident_nm = #{@marque.mar_marques_ident_nm} AND mar_cont_type_tx = 'Acheteur'")
    @contacts_acheteurs = []
    @lienscontactsmarquesAcheteurs.each do |l|
      @contacts_acheteurs.push(Contact.find(l.cont_contacts_ident_nm))
    end
    @contacts_marque = []
    @lienscontactsmarquesMarque = LiensContactMarque.where("mar_marques_ident_nm = #{@marque.mar_marques_ident_nm} AND mar_cont_type_tx = 'Marque'")
    @lienscontactsmarquesMarque.each do |l|
      @contacts_marque.push(Contact.find(l.cont_contacts_ident_nm))
    end
    @current_user_email = User.find(session[:user_id])["email"]
    @current_contact = Contact.find_by(cont_contacts_mail_tx: @current_user_email)
    @current_lien_marque = LiensContactMarque.where(cont_contacts_ident_nm: @current_contact.cont_contacts_ident_nm, mar_marques_ident_nm: @marque_id).first
    @current_contact_est_lie = false
    @contacts_allies = []
    @lienscontactsmarquesAllies = LiensContactMarque.where("mar_marques_ident_nm = #{@marque.mar_marques_ident_nm} AND mar_cont_type_tx = 'Allié'")
    @lienscontactsmarquesAllies.each do |l|
      @cont = Contact.find(l.cont_contacts_ident_nm).attributes
      @cont["mar_marques_ident_nm"] = l.mar_marques_ident_nm
      @cont["mar_cont_relation_tx"] = l.mar_cont_relation_tx
      @cont["mar_cont_design_bl"] = l.mar_cont_design_bl
      @cont["mar_cont_marketing_bl"] = l.mar_cont_marketing_bl
      @cont["mar_cont_communication_bl"] = l.mar_cont_communication_bl
      @cont["mar_cont_event_bl"] = l.mar_cont_event_bl
      @cont["mar_cont_digital_bl"] = l.mar_cont_digital_bl
      @contacts_allies.push(@cont)
      if l.cont_contacts_ident_nm == @current_contact.cont_contacts_ident_nm
        @current_contact_est_lie = true
      end
    end
    # TODO : remplacer boucle par une vue +++++++++++
    if @marque.mar_marques_logo_blb
      @marquelogosrc = "/marques/code_image/" + @marque_id
    else
      # @marquelogosrc = ActionController::Base.helpers.asset_path('ico_img_normal.png')
      @marquelogosrc = ''
    end
  end

  def create
    @par = marque_params
    if @par["mar_typ_ident_nm"] == ""
      @par["mar_typ_ident_nm"] = nil
    end
    if @par["mar_sec_ident_nm"] == ""
      @par["mar_sec_ident_nm"] = nil
    end
    if @par["mar_sta_jur_ident_nm"] == ""
      @par["mar_sta_jur_ident_nm"] = nil
    end
    if @par["mar_sta_ident_nm"] == ""
      @par["mar_sta_ident_nm"] = nil
    end
    if @par["mar_pays_ident_nm"] == ""
      @par["mar_pays_ident_nm"] = nil
    end
    @par["mar_marques_maj_user_tx"] = session[:user_id].to_s
    @par["mar_marques_maj_date_dt"] = Time.current()
    @new_marque = Marque.create(@par)

    if @new_marque.errors.size != 0
      # @new_marque.errors
      @responseJSONKO = {erreur:"MAJ KO"}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSONKO
        }
      end
    else
      @responseJSON = {msg:"MAJ OK",marqueId:@new_marque.mar_marques_ident_nm,marqueName:@new_marque.mar_marques_nom_tx}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSON
        }
      end
    end

  end


  def update
    @par = marque_params_update
    @par["mar_marques_maj_user_tx"] = session[:user_id].to_s
    @par["mar_marques_maj_date_dt"] = Time.current()
    if @par["mar_typ_ident_nm"] == ""
      @par["mar_typ_ident_nm"] = nil
    end
    if @par["mar_sec_ident_nm"] == ""
      @par["mar_sec_ident_nm"] = nil
    end
    if @par["mar_sta_jur_ident_nm"] == ""
      @par["mar_sta_jur_ident_nm"] = nil
    end
    if @par["mar_sta_ident_nm"] == ""
      @par["mar_sta_ident_nm"] = nil
    end
    if @par["mar_pays_ident_nm"] == ""
      @par["mar_pays_ident_nm"] = nil
    end
    # @par["mar_marques_logo_tx"] = @par["mar_marques_logo_blb"] ? @par["mar_marques_logo_blb"].original_filename : ''
    # @par["mar_marques_logo_mime_tx"] = @par["mar_marques_logo_blb"] ? @par["mar_marques_logo_blb"].content_type : ''
    # @marque.mar_marques_logo_blb = @par["mar_marques_logo_blb"].read
    # @marque.save
    # @marque = Marque.find(marque_params_update["mar_marques_ident_nm"])
    @marque = Marque.find(marque_params_update["mar_marques_ident_nm"])
    if @marque.update(@par)
      # @marque = Marque.find(marque_params_update["mar_marques_ident_nm"])
      # @marque.mar_marques_logo_blb = marque_params_update["mar_marques_logo_blb"].read
      # @marque.save
      @responseJSON = {"msg":"MAJ OK","marqueId": @marque.mar_marques_ident_nm}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSON
        }
      end
    else
      render :edit
    end
  end

  def code_image
    @image_data = Marque.find(params[:id])
    @image = @image_data ? @image_data.mar_marques_logo_blb : nil
    if @image
      send_data(@image, :type => @image_data.mar_marques_logo_mime_tx, :filename => @image_data.mar_marques_logo_tx, :disposition => 'inline')
    else
      send_data(@image, :type => '', :filename => '', :disposition => 'inline')
    end
  end

  def addcontact
    redirect_to '/marques/mask/' + params["mar_marques_ident_nm"]
  end

  def marque_params
    params.require("mar_marques_nom_tx")
    params.permit("mar_marques_nom_tx", "mar_sta_jur_ident_nm", "mar_sta_ident_nm", "mar_typ_ident_nm", "mar_sec_ident_nm", "mar_marques_ca_tx", "mar_marques_nb_salaries_nm", "mar_marques_adresse1_tx", "mar_marques_adresse2_tx", "mar_marques_cp_tx", "mar_marques_ville_tx", "mar_pays_ident_nm", "mar_marques_web_tx", "mar_marques_twitter_tx", "mar_marques_facebook_tx", "mar_marques_logo_blb", "image_file")
  end

  def marque_params_update
    params.require("mar_marques_nom_tx")
    params.permit("mar_marques_ident_nm", "mar_marques_nom_tx", "mar_sta_jur_ident_nm", "mar_sta_ident_nm", "mar_typ_ident_nm", "mar_sec_ident_nm", "mar_marques_ca_tx", "mar_marques_nb_salaries_nm", "mar_marques_adresse1_tx", "mar_marques_adresse2_tx", "mar_marques_cp_tx", "mar_marques_ville_tx", "mar_pays_ident_nm", "mar_marques_web_tx", "mar_marques_twitter_tx", "mar_marques_facebook_tx", "mar_marques_logo_blb", "image_file")
  end

end
