class Contact::BaseController < ApplicationController
  before_action :require_contact

  def require_contact
    render file: "/public/404" unless current_contact?
  end
end
