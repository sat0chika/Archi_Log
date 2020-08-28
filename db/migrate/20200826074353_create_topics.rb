class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.timestamps
    end
  end
end
