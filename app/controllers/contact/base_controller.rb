class Contact::BaseController < ApplicationController
  before_action :require_contact, :set_contact

  def require_contact
    flash[:notice] = "Please log in as a contact to update groups or events." unless current_contact?
    redirect_to login_path unless current_contact?
  end

  def set_contact
    @contact = current_user
  end
end
