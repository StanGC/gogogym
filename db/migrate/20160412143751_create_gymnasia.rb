class CreateGymnasia < ActiveRecord::Migration
  def change
    create_table :gymnasia do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :introduction

      t.timestamps null: false
    end
  end
end
