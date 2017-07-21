class Admin::UsersController < Admin::BaseController

  def assign_group_contact
    current_user.groups.each do |group|
      group.contact = current_user
    end
  end

  def index
    @admin = current_user
    @users = User.all
  end

  def show
    redirect_to admin_users_path
  end

  def new
    @user = User.new()
  end

  def create
    @admin = User.find(session[:user_id])
    @user = User.new(user_params)
    if @user.save
      assign_group_contact if @user.contact?
      flash[:success] = "New user created!"
      redirect_to admin_users_path(@user)
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      assign_group_contact if @user.contact?
      flash[:success] = "User updated!"
      redirect_to admin_users_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "User successfully deleted!"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :role, :group_ids, :interest_ids)
  end

end
