class SongRequestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @song_requests = SongRequest.where(event: @event)
  end

  def  new
    @event = Event.find(params[:event_id])
    @song_request = SongRequest.new
  end

  def create
    @song_request = SongRequest.new(song_request_params)
    @event = Event.find(params[:event_id])
    @song_request.event = @event
    @song_request.user = current_user
    if @song_request.save
      redirect_to @song_request
    else
      render :new
    end
  end

  def show
    @song_request = SongRequest.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  private

  def song_request_params
    params.require(@song_request).permit(:input)
  end
end
