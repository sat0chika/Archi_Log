class Like < ApplicationRecord
  belongs_to :person
  belongs_to :topic, counter_cache: :likes_count

  validates :person_id, presence: true
  validates :topic_id, presence: true
  validates_uniqueness_of :topic_id, scope: :person_id
end
