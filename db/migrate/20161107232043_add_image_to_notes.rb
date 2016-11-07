class AddImageToNotes < ActiveRecord::Migration[5.0]
  def up
    add_attachment :notes, :image
  end
  def down
    remove_attachment :notes, :image
  end
end
