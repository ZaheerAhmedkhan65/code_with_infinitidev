class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :file
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  # validates :file, attached: true, content_type: [ "application/pdf" ]

  # scope :draft, -> { where(due_date: nil) }
  # scope :opened, -> { where("due_date <= ?", Time.current) }
  # scope :closed, -> { where("due_date > ?", Time.current) }


  # def draft?
  #   due_date.nil?
  # end

  # def opened?
  #   due_date? && due_date <= Time.current
  # end

  # def closed?
  #   due_date? && due_date > Time.current
  # end
end
