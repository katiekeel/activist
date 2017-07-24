class Contact::GroupsController < Contact::BaseController

# Need to create two instance variables: one scoped off of groups for which user is a contact, and one for which user is just default
# Need to apply this logic to other contact controllers for when user changes from default to contact
# Then edit views so that user can only edit groups/events for which they're a contact once they change from default to contact
# Also need to give contact interests controller

  def index
    @groups = @contact.groups
  end

  def show
    redirect_to contact_groups_path
  end

  def new
    @group = Group.new()
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.interests << Interest.find(group_params[:interest_ids].reject(&:blank?))
      @contact.groups << @group
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
      @contact.groups << @group
      flash[:success] = "Group updated!"
      redirect_to contact_groups_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    group = @contact.groups.find(params[:id])
    @contact.groups.delete(group)
    group.destroy
    flash[:success] = "Group successfully deleted!"
    redirect_to contact_groups_path
  end

  private

  def group_params
    hash = params.require(:group).permit(:name, :description, interest_ids: [])
  end
end
