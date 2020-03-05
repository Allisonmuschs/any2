class AddSolvedToSongRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :song_requests, :solved, :boolean
  end
end
