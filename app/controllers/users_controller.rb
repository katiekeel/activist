class UsersController < ApplicationController
  skip_before_action :current_user

  def show
    @user = current_user
  end

  def new
    @account = User.new()
  end

  def create
    @account = User.new(user_params)
    @account.role = 0 if user_params[:role] == "default"
    @account.role = 2 if user_params[:role] == "contact"
    if @account.save
      flash[:success] = "New account created!"
      redirect_to default_user_dashboard_index_path if @account.default?
      redirect_to contact_dashboard_index_path if @account.contact?
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def edit
    @account = User.find(params[:id])
  end

  def update
    @account = User.find(params[:id])
    @account.role = 0 if user_params[:role] == "default"
    @account.role = 2 if user_params[:role] == "contact"
    if @account.save
      flash[:success] = "New account created!"
      redirect_to default_user_dashboard_index_path if @account.default?
      redirect_to contact_dashboard_index_path if @account.contact?
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "User account successfully deleted!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :role)
  end

end
