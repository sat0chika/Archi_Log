class AddPersonIdToTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :person, foreign_key: true
  end
end
