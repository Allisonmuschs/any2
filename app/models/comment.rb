class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  acts_as_votable

  validates :input, presence: true
  validates :commentable_type, presence: true

  def all_comments
    return if self.comments.empty?
    (self.comments + self.comments.flat_map(&:all_comments)).flatten.compact.uniq
  end
end
