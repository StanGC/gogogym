class CreateCoachSchedules < ActiveRecord::Migration
  def change
    create_table :coach_schedules do |t|
      t.date :date
      t.integer :available
      t.integer :bind
      t.string :info
      t.string :notes
      t.integer :price
      t.integer :promo
      t.string :status
      t.text :information
      t.integer :coach_id

      t.timestamps null: false
    end
  end
end
