class Admin::InterestsController < Admin::BaseController
  def index
    @interests = Interest.all
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def new
    @interest = Interest.new()
  end

  def create
    @admin = User.find(session[:user_id])
    @interest = Interest.new(interest_params)
    if @interest.save
      flash[:success] = "New interest created!"
      redirect_to admin_interests_path(@interest)
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def edit
    interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])
    @interest.update(interest_params)
    if @interest.save
      flash[:success] = "New interest created!"
      redirect_to admin_interest_path(@interest)
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    interest = Interest.find(params[:id])
    interest.delete
    flash[:success] = "Interest successfully deleted!"
    redirect_to admin_interests_path
  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end
end
