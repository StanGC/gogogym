class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :major
      t.text :introduction
      t.integer :gym_id

      t.timestamps null: false
    end
  end
end
