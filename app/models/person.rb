class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  mount_uploader :icon, ImageUploader
  validates :name, presence: true, uniqueness: true
  has_many :topics
  has_many :likes, dependent: :destroy


  def already_liked?(topic)
    self.likes.exists?(topic_id: topic.id)
  end
end