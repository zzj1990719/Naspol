class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :pagt_type
      t.string :sub_type
      t.string :content
      t.string :keyword
      t.integer :grade5
      t.integer :grade4
      t.integer :grade3
      t.integer :grade2
      t.integer :grade1
      t.string :comment
      t.integer :collect

      t.timestamps
    end
  end
end
