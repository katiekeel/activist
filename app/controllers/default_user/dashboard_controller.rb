class DefaultUser::DashboardController < DefaultUser::BaseController

  def index
    @user = current_user
  end

end
