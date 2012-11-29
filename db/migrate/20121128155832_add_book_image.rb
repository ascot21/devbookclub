class AddBookImage < ActiveRecord::Migration
  def up
    add_attachment :books, :coverimage
  end

  def down
    remove_attachment :books, :coverimage
  end
end
