class Contact::BaseController < ApplicationController
  before_action :require_contact

  def require_contact
    flash[:notice] = "Please login to view or update your groups." unless current_contact?
    redirect_to login_path unless current_contact?
  end
end
