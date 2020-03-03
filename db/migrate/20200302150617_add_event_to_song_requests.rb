class AddEventToSongRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :song_requests, :event, foreign_key: true
  end
end
