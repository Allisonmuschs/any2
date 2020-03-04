class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
    if params[:query].present?
        @events = Event.search_by_name params[:query]
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
    @event.save
    redirect_to @event
  end


  def destroy
    #1 . looking for the event in the db
    @event = Event.find(params[:id])

    #2. destroy the event
    @event.destroy


    #3. redirect to the index of events
    redirect_to events_path

  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :artist, :date)
  end
end
