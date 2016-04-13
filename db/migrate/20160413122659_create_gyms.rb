class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :introduction

      t.timestamps null: false
    end
  end
end
