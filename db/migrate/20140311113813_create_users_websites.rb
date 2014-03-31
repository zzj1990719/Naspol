class CreateUsersWebsites < ActiveRecord::Migration
  def change
    create_table :users_websites do |t|
      t.integer :user_id
      t.integer :website_id

      t.timestamps
    end
    add_index :users_websites, :user_id
    add_index :users_websites, :website_id
    add_index :users_websites, [:user_id, :website_id], unique: true
  end
end
