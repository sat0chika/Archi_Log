class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :person, foreign_key: true
      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
