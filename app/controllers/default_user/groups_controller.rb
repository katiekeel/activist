class DefaultUser::GroupsController < DefaultUser::BaseController

  def current_user_contact(group)
    @default_user.update(role: 2)
    group.interests << Interest.find(group_params[:interest_ids].reject(&:blank?))
    @default_user.groups << group
  end

  def index
    @groups = @default_user.groups
  end

  def show
    redirect_to default_user_groups_path
  end

  def new
    @group = @default_user.groups.new()
  end

  def create
    group = Group.new(group_params)
    if group.save
      current_user_contact(group)
      flash[:success] = "New group created!"
      redirect_to contact_groups_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def update
    group = Group.find(params[:id])
    @default_user.groups << group
    flash[:success] = "Group added to your list!"
    redirect_to default_user_groups_path if current_user.default?
    redirect_to contact_groups_path if current_user.contact?
  end

  def destroy
    group = @default_user.groups.find(params[:id])
    @default_user.groups.delete(group)
    flash[:success] = "Group successfully deleted!"
    redirect_to default_user_groups_path
  end

  private

  def group_params
    hash = params.require(:group).permit(:name, :description, interest_ids: [])
    hash[:contact] = @default_user
    hash
  end

end
