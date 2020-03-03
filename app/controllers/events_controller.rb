class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
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

  private

  def event_params
    params.require(:event).permit(:name, :location, :artist, :date)
  end
end
