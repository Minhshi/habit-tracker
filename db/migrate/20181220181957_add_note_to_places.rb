class AddNoteToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :places, :note, foreign_key: true
  end
end
