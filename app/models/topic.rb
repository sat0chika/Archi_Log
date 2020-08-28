class Topic < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true

  belongs_to :person, optional: true
  has_many :likes, dependent: :destroy

end
