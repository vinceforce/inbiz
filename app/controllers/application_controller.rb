class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_contact
  before_action :check_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def check_current_user
    if !current_user
      redirect_to root_path
    end
  end

  def current_contact
    @current_contact = Contact.find_by(cont_contacts_mail_tx: current_user.email)
  end
end
