class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      @contact = Contact.find_by(cont_contacts_mail_tx: user.email)
      logger.debug "Connexion Google : user.email => #{user.email}"
      if @contact
        @liencontactmarque = LiensContactMarque.where(cont_contacts_ident_nm: @contact.cont_contacts_ident_nm)
        if @liencontactmarque.size == 0
          # si l'adresse mail est enregistrée dans la table de contact,
          # et que ce contact n'a pas été créé comme contact acheteur ou marque
          # on créée l'accès au site pour ce compte Google
          user.save!
          @contact.update(cont_contacts_googleid_tx: user.uid)
        end
      end
    end
  end
end
