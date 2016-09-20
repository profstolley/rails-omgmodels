class AddNotebookRefToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :notebook, foreign_key: true
  end
end
