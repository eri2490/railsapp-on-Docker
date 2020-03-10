class AddIndexToRelathionships < ActiveRecord::Migration[5.2]
  def change
    add_index :relationships, :user_id
    add_index :relationships, [:follow_user_id, :user_id], unique: true
  end
end
