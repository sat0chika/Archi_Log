class AddIntroductionToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :introduction, :text
  end
end
