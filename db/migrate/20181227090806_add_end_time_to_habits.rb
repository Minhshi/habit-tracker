class AddEndTimeToHabits < ActiveRecord::Migration[5.2]
  def change
    add_column :habits, :end_time, :datetime
  end
end
