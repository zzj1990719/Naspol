class CreateRecommendsUsers < ActiveRecord::Migration
  def change
    create_table :recommends_users do |t|
      t.integer :user_id
      t.integer :recommend_id

      t.timestamps
    end
    add_index :recommends_users, :user_id
    add_index :recommends_users, :recommend_id
    add_index :recommends_users, [:user_id, :recommend_id], unique: true     #确保user和page的关系是唯一的，这样就不会
  end
end
