class Lesson < ApplicationRecord
  belongs_to :course

  validates :title, :content, presence: true

  validates :lesson_date, presence: true

  # default_scope { order(lesson_date: :asc) }

  has_many :comments
  has_many :likes

  def comments
    Comment.where(commentable: self)
  end

  def likes
    Like.where(likeable: self)
  end
end
