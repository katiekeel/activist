class Admin::GroupsController < Admin::BaseController
  def index
    @admin = current_user
    @groups = Group.all
  end

  def show
    redirect_to admin_groups_path
  end

  def new
    @group = Group.new()
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "New group created!"
      redirect_to admin_groups_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.save
      flash[:success] = "Interest updated!"
      redirect_to admin_groups_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.delete
    flash[:success] = "Interest successfully deleted!"
    redirect_to admin_groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :contact_id, :interest_ids)
  end
end
