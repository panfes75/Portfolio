class CreateWeekSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :week_schedules do |t|
      t.integer :monday_work_time
      t.integer :tuesday_work_time
      t.integer :Wednes_daywork_time
      t.integer :Thursday_work_time
      t.integer :Friday_work_time
      t.integer :Saturday_work_time
      t.integer :Sunday_work_time
      t.references :operation_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
