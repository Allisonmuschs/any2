class SongRequest < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :comments, as: :commentable, dependent: :destroy

  validates :input, presence: true

end
