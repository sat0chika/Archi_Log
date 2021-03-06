class Topic < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :heading, presence: true, length: { maximum: 140 }
  validates :description, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :person, optional: true
  has_many :likes, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def self.search(search)
    if search != ""
      Topic.where('title LIKE(?) OR heading LIKE(?) OR description LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Topic.all
    end
  end

  def liked_by?(person)
    likes.where(person_id: person.id).exists?
  end

  def save_tag(sent_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

  end
end
