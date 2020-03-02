class CreateSongRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :song_requests do |t|
      t.string :input
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
