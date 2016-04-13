class AddCoachIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :coach_id, :integer
  end
end
