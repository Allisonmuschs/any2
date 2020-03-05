class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  acts_as_votable

  validates :input, presence: true
  validates :commentable_type, presence: true
end
