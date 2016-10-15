class ContactController < ApplicationController
  def addtomarque

  end

  def create
  end

  def contact_params
    params.require("cont_contacts_nom_tx")
    params.require("cont_contacts_prenom_tx")
    params.permit("cont_contacts_societe_tx", "cont_contacts_mail_tx", "cont_contacts_tel_mobile_tx", "cont_contacts_tel_fixe_tx", "cont_contacts_facebook_tx", "cont_contacts_comp_metiers_tx", "cont_contacts_conn_secteur_tx", "cont_contacts_interets_tx", "cont_contacts_statut_tx", "cont_contacts_googleid_tx", "cont_contacts_fax_tx", "cont_contacts_fonction_tx", "cont_contacts_direction_service_tx", "cont_contacts_pouvoir_tx", "cont_contacts_projets_realises_nm", "cont_contacts_civilite_tx", "cont_contacts_linkedin_tx")
  end

end
