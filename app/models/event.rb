class Event < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :song_requests, dependent: :destroy
    has_one_attached :song_file
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: { scope: :date }
  validates :artist, presence: true
  validates :date, presence: true
end
