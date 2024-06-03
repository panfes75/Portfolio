class AddTaskToOperationPlans < ActiveRecord::Migration[7.1]
  def up
    change_column_null :operation_plans, :task, false
    change_column_null :operation_plans, :work_time, false
    change_column_null :operation_plans, :stamp, false
  end

  def down
    change_column_null :operation_plans, :task, true
    change_column_null :operation_plans, :work_time, true
    change_column_null :operation_plans, :stamp, true
  end
end
