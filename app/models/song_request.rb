class SongRequest < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :song_file

  validates :input, presence: true



  def top_comment
    all_comments.compact.sort_by{|co| co.get_upvotes.size}.reverse.first
  end

  def all_comments
    return [] if self.comments.empty?
    (self.comments + self.comments.flat_map(&:all_comments)).flatten.uniq
  end
end
