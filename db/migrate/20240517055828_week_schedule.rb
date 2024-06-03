class WeekSchedule < ActiveRecord::Migration[7.1]
  def change
    drop_table :week_schedules
  end
end
