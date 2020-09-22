class CreateTagMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_maps do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end