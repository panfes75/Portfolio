class ChangeColumnOperationPlans < ActiveRecord::Migration[7.1]
  def change
    rename_column :operation_plans, :monday_work_time, :work_time
    rename_column :operation_plans, :tuesday_work_time, :stamp
  end
end
