class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follow_user_id
      t.integer :user_id

      t.timestamps
    end
    add_index :relationships, :follow_user_id
  end
end
