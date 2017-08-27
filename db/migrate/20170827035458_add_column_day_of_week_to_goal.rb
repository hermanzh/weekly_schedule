class AddColumnDayOfWeekToGoal < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :day_of_week, :integer, index: true, default: 0
  end
end
