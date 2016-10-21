class ContactController < ApplicationController
  def addcontact
    @par = contact_params
    @par["cont_contacts_maj_user_tx"] = session[:user_id].to_s
    @par["cont_contacts_maj_date_dt"] = Time.current()
    @new_contact = Contact.create(@par.except("mar_marques_ident_nm", "mar_cont_type_tx"))
    if @new_contact.errors.size != 0
      # @new_contact.errors
      @responseJSONKO = {erreur:"MAJ KO"}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSONKO
        }
      end
    else
      @new_liencontactmarque = LiensContactMarque.new
      @new_liencontactmarque["mar_marques_ident_nm"] = @par["mar_marques_ident_nm"].to_i
      @new_liencontactmarque["cont_contacts_ident_nm"] = @new_contact["cont_contacts_ident_nm"].to_i
      @new_liencontactmarque["mar_cont_type_tx"] = @par["mar_cont_type_tx"]
      @new_liencontactmarque.save
      if @new_liencontactmarque.errors.size == 0
        @responseJSON = {msg:"MAJ OK",contactId:@new_contact.cont_contacts_ident_nm}
        respond_to do |format|
          format.html
          format.json {
            render json: @responseJSON
          }
        end
      else
        @responseJSONKO = {erreur:"MAJ KO"}
        respond_to do |format|
          format.html
          format.json {
            render json: @responseJSONKO
          }
        end
      end
    end
  end

  def updatecontact
    @par = contact_params_update
    @par["cont_contacts_maj_user_tx"] = session[:user_id].to_s
    @par["cont_contacts_maj_date_dt"] = Time.current()
    @contact = Contact.find(@par["cont_contacts_ident_nm"])
    if @contact.update(@par.except("mar_marques_ident_nm", "mar_cont_type_tx"))
      @contact.save
      @responseJSON = {"msg":"MAJ OK","contactId": @contact.cont_contacts_ident_nm}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSON
        }
      end
    else
      @responseJSONKO = {erreur:"MAJ KO"}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSONKO
        }
      end
    end
  end

  def updateprofil
    @par = contact_params_updateprofil
    @par["cont_contacts_maj_user_tx"] = session[:user_id].to_s
    @par["cont_contacts_maj_date_dt"] = Time.current()
    @contact = Contact.find(@par["cont_contacts_ident_nm"])
    if @contact.update(@par)
      @contact.save
      @responseJSON = {"msg":"MAJ OK","contactId": @contact.cont_contacts_ident_nm}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSON
        }
      end
    else
      @responseJSONKO = {erreur:"MAJ KO"}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSONKO
        }
      end
    end
  end

  def destroy
    @par = contact_params_destroy
    @LiensContactMarque = LiensContactMarque.where(cont_contacts_ident_nm: contact_params_destroy["cont_contacts_ident_nm"])
    @LiensContactMarque.each do |l|
      l.destroy
    end
    @contact = Contact.find(contact_params_destroy["cont_contacts_ident_nm"])
    @contact.destroy
  end


  def addcontactallie
    @par = contact_params_allie
    @par["cont_contacts_maj_user_tx"] = session[:user_id].to_s
    @par["cont_contacts_maj_date_dt"] = Time.current()
    @contact = Contact.find(@par["cont_contacts_ident_nm"])
    if @contact.update(@par.except("mar_marques_ident_nm", "mar_cont_relation_tx", "mar_cont_design_bl", "mar_cont_marketing_bl", "mar_cont_communication_bl", "mar_cont_event_bl", "mar_cont_digital_bl"))
      @contact.save
      @oldliencontactmarque = LiensContactMarque.where("cont_contacts_ident_nm = #{@contact.cont_contacts_ident_nm} AND mar_marques_ident_nm = #{@par["mar_marques_ident_nm"]}").first
      if !@oldliencontactmarque
        @par["mar_cont_type_tx"] = 'Allié'
        @liencontactmarque = LiensContactMarque.create(@par.except("cont_contacts_maj_user_tx", "cont_contacts_maj_date_dt", "cont_contacts_conn_secteur_tx", "cont_contacts_comp_metiers_tx"))
        @go = (@liencontactmarque.errors.size == 0)
      else
        if @oldliencontactmarque.update(@par.except("cont_contacts_maj_user_tx", "cont_contacts_maj_date_dt", "cont_contacts_conn_secteur_tx", "cont_contacts_comp_metiers_tx"))
          @go = true
        else
          @go = false
        end
      end
      if @liencontactmarque.errors.size == 0
        @responseJSON = {"msg":"MAJ OK","contactId": @contact.cont_contacts_ident_nm}
        respond_to do |format|
          format.html
          format.json {
            render json: @responseJSON
          }
        end
      else
        @responseJSONKO = {erreur:"MAJ KO"}
        respond_to do |format|
          format.html
          format.json {
            render json: @responseJSONKO
          }
        end
      end
    else
      @responseJSONKO = {erreur:"MAJ KO"}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSONKO
        }
      end
    end
  end

  def updatecontactallie
    @par = contact_params_update_allie
    @par["cont_contacts_maj_user_tx"] = session[:user_id].to_s
    @par["cont_contacts_maj_date_dt"] = Time.current()
    @contact = Contact.find(@par["cont_contacts_ident_nm"])
    if @contact.update(@par.except("mar_marques_ident_nm", "mar_cont_relation_tx", "mar_cont_design_bl", "mar_cont_marketing_bl", "mar_cont_communication_bl", "mar_cont_event_bl", "mar_cont_digital_bl"))
      @contact.save
      @liencontactmarque = LiensContactMarque.where("cont_contacts_ident_nm = #{@contact.cont_contacts_ident_nm} AND mar_marques_ident_nm = #{@par["mar_marques_ident_nm"]}").first
      if @liencontactmarque.update(@par.except("cont_contacts_maj_user_tx", "cont_contacts_maj_date_dt", "cont_contacts_conn_secteur_tx", "cont_contacts_comp_metiers_tx"))
        @responseJSON = {"msg":"MAJ OK","contactId": @contact.cont_contacts_ident_nm}
        respond_to do |format|
          format.html
          format.json {
            render json: @responseJSON
          }
        end
      else
        @responseJSONKO = {erreur:"MAJ KO"}
        respond_to do |format|
          format.html
          format.json {
            render json: @responseJSONKO
          }
        end
      end
    else
      @responseJSONKO = {erreur:"MAJ KO"}
      respond_to do |format|
        format.html
        format.json {
          render json: @responseJSONKO
        }
      end
    end
  end


  def edit
    @contact_id = params[:id]
    @contact = Contact.find(@contact_id)
    @current_user = User.find(session[:user_id])
    @current_contact = Contact.find_by(cont_contacts_googleid_tx: @current_user.uid)
    if @current_contact.cont_contacts_ident_nm == @contact_id
      @sectionclassadd = ' proprietaire'
    end
    @sectionclassadd = ' proprietaire'
    @lienscontactmarqueDB = LiensContactMarque.where("cont_contacts_ident_nm = #{@contact.cont_contacts_ident_nm}")
    @lienscontactmarque = []
    @lienscontactmarqueDB.each do |lcmDB|
      @lcm = lcmDB.attributes
      @m = Marque.find(lcmDB.mar_marques_ident_nm)
      @lcm["mar_marques_logo_tx"] = @m["mar_marques_logo_tx"]
      @lcm["mar_marques_nom_tx"] = @m["mar_marques_nom_tx"]
      @lcm["mar_sta_ident_nm"] = @m["mar_sta_ident_nm"]
      @lcm["mar_sta_jur_ident_nm"] = @m["mar_sta_jur_ident_nm"]
      @lienscontactmarque.push(@lcm)
    end
    @statuts = Statut.all
    @statuts_juridiques = StatutJuridique.all
  end


  def contact_params
    params.require("cont_contacts_nom_tx")
    params.require("cont_contacts_prenom_tx")
    params.require("mar_marques_ident_nm")
    params.permit("mar_marques_ident_nm", "mar_cont_type_tx", "cont_contacts_nom_tx", "cont_contacts_prenom_tx", "cont_contacts_societe_tx", "cont_contacts_mail_tx", "cont_contacts_tel_mobile_tx", "cont_contacts_tel_fixe_tx", "cont_contacts_facebook_tx", "cont_contacts_comp_metiers_tx", "cont_contacts_conn_secteur_tx", "cont_contacts_interets_tx", "cont_contacts_statut_tx", "cont_contacts_googleid_tx", "cont_contacts_fax_tx", "cont_contacts_fonction_tx", "cont_contacts_direction_service_tx", "cont_contacts_pouvoir_tx", "cont_contacts_projets_realises_nm", "cont_contacts_civilite_tx", "cont_contacts_linkedin_tx")
  end
  def contact_params_update
    params.require("cont_contacts_nom_tx")
    params.require("cont_contacts_prenom_tx")
    params.require("mar_marques_ident_nm")
    params.require("cont_contacts_ident_nm")
    params.permit("cont_contacts_ident_nm", "mar_marques_ident_nm", "mar_cont_type_tx", "cont_contacts_nom_tx", "cont_contacts_prenom_tx", "cont_contacts_societe_tx", "cont_contacts_mail_tx", "cont_contacts_tel_mobile_tx", "cont_contacts_tel_fixe_tx", "cont_contacts_facebook_tx", "cont_contacts_comp_metiers_tx", "cont_contacts_conn_secteur_tx", "cont_contacts_interets_tx", "cont_contacts_statut_tx", "cont_contacts_googleid_tx", "cont_contacts_fax_tx", "cont_contacts_fonction_tx", "cont_contacts_direction_service_tx", "cont_contacts_pouvoir_tx", "cont_contacts_projets_realises_nm", "cont_contacts_civilite_tx", "cont_contacts_linkedin_tx")
  end
  def contact_params_update_allie
    params.require("mar_marques_ident_nm")
    params.require("cont_contacts_ident_nm")
    params.permit("cont_contacts_ident_nm", "mar_marques_ident_nm", "cont_contacts_comp_metiers_tx", "cont_contacts_conn_secteur_tx", "mar_cont_relation_tx", "mar_cont_design_bl", "mar_cont_marketing_bl", "mar_cont_communication_bl", "mar_cont_event_bl", "mar_cont_digital_bl")
  end
  def contact_params_updateprofil
    params.require("cont_contacts_ident_nm")
    params.permit("cont_contacts_ident_nm", "cont_contacts_conn_secteur_tx", "cont_contacts_comp_metiers_tx", "cont_contacts_interets_tx")
  end
  def contact_params_destroy
    params.require("cont_contacts_ident_nm")
    params.permit("cont_contacts_ident_nm")
  end
  def contact_params_allie
    params.require("cont_contacts_ident_nm")
    params.permit("cont_contacts_ident_nm", "mar_marques_ident_nm", "mar_cont_relation_tx", "cont_contacts_conn_secteur_tx", "cont_contacts_comp_metiers_tx", "mar_cont_design_bl", "mar_cont_marketing_bl", "mar_cont_communication_bl", "mar_cont_event_bl", "mar_cont_digital_bl")
  end
end
