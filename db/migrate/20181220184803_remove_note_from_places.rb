class RemoveNoteFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_reference :places, :note, foreign_key: true
  end
end
