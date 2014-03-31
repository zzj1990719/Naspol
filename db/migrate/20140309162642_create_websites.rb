class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :web_type
      t.string :sub_type
      t.string :name
      t.string :url
      t.string :brief
      t.integer :grade5
      t.integer :grade4
      t.integer :grade3
      t.integer :grade2
      t.integer :grade1
      t.string :comment
      t.integer :refer_id
      t.integer :collect

      t.timestamps
    end
  end
end
