class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :file

  validates :title, presence: true
  validates :description, presence: true
  validates :file, attached: true, content_type: [ "application/pdf" ]
end
