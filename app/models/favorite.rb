class Favorite < ApplicationRecord
  belongs_to :song_request
  belongs_to :user
end
