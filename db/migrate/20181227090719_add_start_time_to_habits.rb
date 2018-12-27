class AddStartTimeToHabits < ActiveRecord::Migration[5.2]
  def change
    add_column :habits, :start_time, :datetime
  end
end
