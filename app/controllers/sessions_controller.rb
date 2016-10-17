class SessionsController < ApplicationController
skip_before_action :check_current_user
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # TODO : ajouter la mise à jour du profil InBiz si existant ou la création du profil InBiz si non existant
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
