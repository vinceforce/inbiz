class ContactController < ApplicationController
  def addcontact
    @par = contact_params
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

  def destroy
    @par = contact_params_destroy
    @LiensContactMarque = LiensContactMarque.where(cont_contacts_ident_nm: contact_params_destroy["cont_contacts_ident_nm"])
    @LiensContactMarque.each do |l|
      l.destroy
    end
    @contact = Contact.find(contact_params_destroy["cont_contacts_ident_nm"])
    @contact.destroy
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
  def contact_params_destroy
    params.require("cont_contacts_ident_nm")
    params.permit("cont_contacts_ident_nm")
  end
end
