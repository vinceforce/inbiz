class SessionsController < ApplicationController
skip_before_action :check_current_user
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # redirect_to root_path
    @contact = Contact.find_by(cont_contacts_mail_tx: user.email)
    redirect_to '/contacts/edit/' + @contact.cont_contacts_ident_nm.to_s
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
