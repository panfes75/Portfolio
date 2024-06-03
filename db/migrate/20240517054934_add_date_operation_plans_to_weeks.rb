class AddDateOperationPlansToWeeks < ActiveRecord::Migration[7.1]
  def change
    add_column :operation_plans, :monday_work_time, :integer
    add_column :operation_plans, :tuesday_work_time, :integer
    add_column :operation_plans, :wednesday_work_time, :integer
    add_column :operation_plans, :thursday_work_time, :integer
    add_column :operation_plans, :friday_work_time, :integer
    add_column :operation_plans, :saturday_work_time, :integer
    add_column :operation_plans, :sunday_work_time, :integer
  end
end
