class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def profile
    user = User.find params[:user_id]
    @comments = user.comments
    @username = user.username
    @song_requests = user.song_requests
    @events = user.events
  end

  def library
    @song_requests = SongRequest.where(solved: :true)
  end

end
