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
      if @contact
        @liencontactmarque = LiensContactMarque.where(cont_contacts_ident_nm: @contact.cont_contacts_ident_nm)
        if @liencontactmarque.size == 0
          user.save!
        end
      end
    end
  end
end
