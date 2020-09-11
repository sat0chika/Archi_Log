class Topic < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :person, optional: true
  has_many :likes, dependent: :destroy

  def liked_by?(person)
    likes.where(person_id: person.id).exists?
  end

end