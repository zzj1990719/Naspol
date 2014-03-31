class CreateReminds < ActiveRecord::Migration
  def change
    create_table :reminds do |t|
      t.string :website
      t.string :url
      t.string :remind_text

      t.timestamps
    end
  end
end
