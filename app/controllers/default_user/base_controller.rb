class DefaultUser::BaseController < ApplicationController
  before_action :require_default, :set_user

  def require_default
    flash[:notice] = "Please login to access admin dashboard." unless current_default? || current_contact?
    redirect_to login_path unless current_default? || current_contact?
  end

  def set_user
    @default_user = current_user
  end

end
