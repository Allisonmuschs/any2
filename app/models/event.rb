class Event < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :song_requests, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :artist, presence: true
  validates :date, presence: true
end
