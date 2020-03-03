class Event < ApplicationRecord
  belongs_to :user
  has_many :song_requests, dependent: :destroy
end
