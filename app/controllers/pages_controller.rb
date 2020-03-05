class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def profile
    @comments = current_user.comments
    @username = current_user.username
    @song_requests = current_user.song_requests
    @events = current_user.events
  end

  def library
    @song_requests = SongRequest.where(solved: :true)
  end

end
