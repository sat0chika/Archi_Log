class Topic < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :heading, presence: true, length: { maximum: 140 }
  validates :image, presence: true
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

    #   old_tags.each do |old|
    #     self.topic_tags.delete TopicTag.find_by(topic_tag_name: old)
    #   end

    #   new_tags.each do |new|
    #     new_topic_tag = TopicTag.find_or_create_by(topic_tag_name: new)
    #     self.topic_tags << new_topic_tag
    #   end
  end
end
