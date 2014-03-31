class CreateRemindsUsers < ActiveRecord::Migration
  def change
    create_table :reminds_users do |t|
      t.integer :user_id
      t.integer :remind_id

      t.timestamps
    end
    add_index :reminds_users, :user_id
    add_index :reminds_users, :remind_id
    add_index :reminds_users, [:user_id, :remind_id], unique: true     #确保user和page的关系是唯一的，这样就不会重复了
  end
end
