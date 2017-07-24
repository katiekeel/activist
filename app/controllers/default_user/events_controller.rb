class DefaultUser::EventsController < DefaultUser::BaseController

  def index
    @events = @default_user.events
  end

  def show
    @event = @default_user.events.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @default_user.events << @event
    flash[:success] = "Event added to your list!"
    redirect_to default_user_events_path
  end

  def destroy
    event = @default_user.events.find(params[:id])
    @default_user.events.delete(event)
    flash[:success] = "Event successfully deleted!"
    redirect_to default_user_events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, :zipcode, :group_ids, :interest_ids)
  end
end
