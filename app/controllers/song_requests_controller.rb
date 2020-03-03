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
       redirect_to event_song_requests_path

    else
      render :new
    end
  end

  def show
    @song_request = SongRequest.find(params[:id])
    @event = @song_request.event
  end

  def destroy
    @song_request = SongRequest.find(params[:id])
    @song_request.destroy
    redirect_to event_path(@song_request.event)
  end

  private

  def song_request_params
    params.require(:song_request).permit(:input)
  end
end


