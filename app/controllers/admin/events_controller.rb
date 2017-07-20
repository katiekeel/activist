class Admin::EventsController < Admin::BaseController
  def index
    @admin = current_user
    @events = Event.all
  end

  def show
    redirect_to admin_events_path
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "New event created!"
      redirect_to admin_events_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      flash[:success] = "Interest updated!"
      redirect_to admin_events_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.delete
    flash[:success] = "Interest successfully deleted!"
    redirect_to admin_events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, :zipcode, :group_ids, :interest_ids)
  end
end
