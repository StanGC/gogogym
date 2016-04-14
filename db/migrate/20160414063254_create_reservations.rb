class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :coach_id
      t.string :first_name
      t.string :last_name
      t.string :message
      t.string :ip_address
      t.date :start_at
      t.date :end_at

      t.timestamps null: false
    end
  end
end
