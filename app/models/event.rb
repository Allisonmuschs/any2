class Event < ApplicationRecord
  belongs_to :user
  has_many :song_requests, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :artist, presence: true
  validates :date, presence: true
end
