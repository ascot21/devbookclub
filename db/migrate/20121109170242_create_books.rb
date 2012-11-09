class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.text :description
      t.text :buy_link

      t.timestamps
    end
  end
end
