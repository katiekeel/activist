class Contact::DashboardController < Contact::BaseController

  def index
    @contact = current_user
  end

end
