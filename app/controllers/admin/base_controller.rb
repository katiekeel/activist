class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    flash[:notice] = "Please login to access admin dashboard."
    redirect_to login_path unless current_admin?
  end
end
