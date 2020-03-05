class FavoritesController < ApplicationController

  def create
    # 1. check if the sg is in the table
    @song_request = SongRequest.find(params[:song_request_id])
    @favorite = current_user.favorites.find_by(song_request: @song_request)
    if @favorite.present?
    # 3. if in the table => destroy it
      @favorite.destroy
    # 2. if in not in the table => create it
          redirect_to event_path(@song_request.event)

    else
    @favorite = Favorite.new
    @song_request = SongRequest.find(params[:song_request_id])
    @favorite.song_request = @song_request
    @favorite.user = current_user
      if @favorite.save
        redirect_to event_path(@song_request.event)
      else
        render :new
      end
    end
  end


  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to event_path(@song_request.event)
  end

end
