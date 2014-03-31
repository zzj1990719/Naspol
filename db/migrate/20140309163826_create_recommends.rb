class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :websit_id
      t.integer :page_id
      t.string :text

      t.timestamps
    end
  end
end
