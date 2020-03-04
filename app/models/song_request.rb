class SongRequest < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :song_file

  validates :input, presence: true, uniqueness: true

end
