class MarqueController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def show
    @sectionclassadd = ''
  end

  def new
    @sectionclassadd = ' creation'
    @showmarquebuttons = true
    @statutsjuridiques = StatutJuridique.all.order("mar_sta_jur_lib_tx")
    @statuts = Statut.all.order("mar_sta_lib_tx")
    @types = Type.all.order("mar_typ_lib_tx")
    @secteurs = Secteur.all.order("mar_sec_lib_tx")
    @pays = Pays.all.order("mar_pays_lib_tx")
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
    @sectionclassadd = ' proprietaire'
    @showmarquebuttons = true
    @statutsjuridiques = StatutJuridique.all.order("mar_sta_jur_lib_tx")
    @statuts = Statut.all.order("mar_sta_lib_tx")
    @types = Type.all.order("mar_typ_lib_tx")
    @secteurs = Secteur.all.order("mar_sec_lib_tx")
    @pays = Pays.all.order("mar_pays_lib_tx")
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

    # @new_marque = Marque.new
    # @par.each_key do |k|
    #   if k != "mar_marques_ident_nm"
    #     @new_marque[k] = @par[k]
    #   end
    # end
    # @new_marque.save

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
    @marque = Marque.find(marque_params_update["mar_marques_ident_nm"])
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
    if @marque.update(@par)
      @marque.save
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

  def marque_params
    params.require("mar_marques_nom_tx")
    params.permit("mar_marques_nom_tx", "mar_sta_jur_ident_nm", "mar_sta_ident_nm", "mar_typ_ident_nm", "mar_sec_ident_nm", "mar_marques_ca_tx", "mar_marques_nb_salaries_nm", "mar_marques_adresse1_tx", "mar_marques_adresse2_tx", "mar_marques_cp_tx", "mar_marques_ville_tx", "mar_pays_ident_nm", "mar_marques_web_tx", "mar_marques_twitter_tx", "mar_marques_facebook_tx")
  end

  def marque_params_update
    params.require("mar_marques_nom_tx")
    params.permit("mar_marques_ident_nm", "mar_marques_nom_tx", "mar_sta_jur_ident_nm", "mar_sta_ident_nm", "mar_typ_ident_nm", "mar_sec_ident_nm", "mar_marques_ca_tx", "mar_marques_nb_salaries_nm", "mar_marques_adresse1_tx", "mar_marques_adresse2_tx", "mar_marques_cp_tx", "mar_marques_ville_tx", "mar_pays_ident_nm", "mar_marques_web_tx", "mar_marques_twitter_tx", "mar_marques_facebook_tx")
  end

end
