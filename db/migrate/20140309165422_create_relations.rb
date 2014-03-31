class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :user_id
      t.integer :f_page_id
      t.integer :f_website_id
      t.integer :f_remind_id
      t.integer :f_recommend_id
      t.integer :create_page_id

      t.timestamps
    end
  end
end
