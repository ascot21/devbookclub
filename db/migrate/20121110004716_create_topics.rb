class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :body
      t.references :book

      t.timestamps
    end
    add_index :topics, :book_id
  end
end
