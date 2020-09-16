class AddLikeCountToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :like_count, :integer
  end
end
