class Contact::EventsController < Contact::BaseController

  def index
    @events = []
    groups = Group.where(contact: @contact)
    groups.each do |group|
      group.events.each do |event|
        @events << event
      end
    end
    @events.reject(&:blank?)
  end

  def show
    redirect_to contact_events_path
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @contact.events << @event
      flash[:success] = "New event created!"
      redirect_to contact_events_path
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
      flash[:success] = "Event updated!"
      redirect_to contact_events_path
    else
      flash[:failure] = "Please enter attributes correctly."
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    flash[:success] = "Event successfully deleted!"
    redirect_to contact_events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, :zipcode, :group_ids, :interest_ids)
  end
end
