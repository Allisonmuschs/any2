class EventsController < ApplicationController
  def index
    @events = Event.limit(30)
    @event = Event.new
    if params[:query].present?
        @events = Event.search_by_name params[:query]
        redirect_to event_path(@events.first) if @events.size == 1
        redirect_to root_path, notice: "No event existing" if @events.size == 0
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: "Successfully created the event!"
    else
      redirect_back fallback_location: events_path, notice: "The event already exists"
    end
  end


  def destroy
    #1 . looking for the event in the db
    @event = Event.find(params[:id])

    #2. destroy the event
    @event.destroy


    #3. redirect to the index of events
    redirect_to events_path

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :artist, :date, :city)
  end
end
