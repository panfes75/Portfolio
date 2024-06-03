class RemoveOperationPlans < ActiveRecord::Migration[7.1]
  def change
    remove_column :operation_plans, :start_on, :date 
    remove_column :operation_plans, :completion_on, :date
    remove_column :operation_plans, :remind, :boolean
    remove_column :operation_plans, :wednesday_work_time, :integer
    remove_column :operation_plans, :thursday_work_time, :integer
    remove_column :operation_plans, :friday_work_time, :integer
    remove_column :operation_plans, :saturday_work_time, :integer
    remove_column :operation_plans, :sunday_work_time, :integer
  end
end