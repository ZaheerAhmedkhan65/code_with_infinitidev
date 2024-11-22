class Course < ApplicationRecord
  belongs_to :user

  has_many :lessons, dependent: :destroy
  has_many :assignments, dependent: :destroy # Directly related to assignments

  validates :title, presence: true
  validates :description, presence: true
  validates :fee, presence: true
end
