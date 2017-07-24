class DefaultUser::InterestsController < DefaultUser::BaseController

  def index
    @interests = @default_user.interests
  end

  def show
    redirect_to default_user_interests_path
  end

  def update
    interest = Interest.find(params[:id])
    @default_user.interests << interest
    flash[:success] = "Interest added to your list!"
    redirect_to default_user_interests_path
  end

  def destroy
    interest = @default_user.interests.find(params[:id])
    @default_user.interests.delete(interest)
    flash[:success] = "Interest successfully deleted!"
    redirect_to default_user_interests_path
  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end

end
