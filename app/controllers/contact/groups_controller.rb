class Contact::GroupsController < ApplicationController
  def index
    @contact = current_user
    @groups = current_user.groups
  end

  def show
    redirect_to contact_groups_path
  end

  def new
    @contact = current_user
    @group = @contact.groups.new()
  end

  def create
    contact = current_user
    group = Group.new(group_params)
    if group.save
      contact.groups << group
      flash[:success] = "New group created!"
      redirect_to contact_groups_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def edit
    @group = @contact.groups.find(params[:id])
  end

  def update
    @group = @contact.groups.find(params[:id])
    @group.update(group_params)
    if @group.save
      flash[:success] = "Interest updated!"
      redirect_to contact_groups_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    byebug
    contact = current_user
    group = contact.groups.find(params[:id])
    group.destroy
    flash[:success] = "Interest successfully deleted!"
    redirect_to contact_groups_path
  end

  private

  def group_params
    @contact = current_user
    hash = params.require(:group).permit(:name, :description, :interest_ids)
    hash[:contact] = @contact
    hash
  end
end
