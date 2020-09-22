class AddHeadingToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :heading, :text
  end
end
