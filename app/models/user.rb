class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Attachments
  has_one_attached :avatar

  # Validations
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "can only contain letters, numbers, and underscores" }
  validates :avatar, presence: true, content_type: [ "image/png", "image/jpg", "image/jpeg" ], size: { less_than: 5.megabytes, message: "is too large" }

  # Enums
  enum :role, { student: 0, admin: 1 }

  # Scopes
  scope :students, -> { where(role: :student) }
  scope :admins, -> { where(role: :admin) }

  # Associations
  has_many :courses, dependent: :destroy
  has_many :lessons, through: :courses
  has_many :assignments, through: :courses
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Allow conditional avatar validation
  attr_accessor :skip_avatar_validation
  validates :avatar, presence: true, unless: :skip_avatar_validation
end
