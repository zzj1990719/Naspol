class CreatePagesUsers < ActiveRecord::Migration
  def change
    create_table :pages_users do |t|
      t.integer :user_id
      t.integer :page_id

      t.timestamps
      
    end
    add_index :pages_users, :user_id
    add_index :pages_users, :page_id
    add_index :pages_users, [:user_id, :page_id], unique: true     #确保user和page的关系是唯一的，这样就不会重复了
  end
end
