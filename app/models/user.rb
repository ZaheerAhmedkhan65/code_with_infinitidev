class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true
  validates :avatar, presence: true

  enum :role, { student: 0, admin: 1 }


  scope :students, -> { where(role: :student) }

  has_many :courses
  has_many :lessons, through: :courses
  has_many :assignments, through: :courses
  has_many :comments
  has_many :likes
end
