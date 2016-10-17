class HomeController < ApplicationController
skip_before_action :check_current_user
  def show
  end
end
