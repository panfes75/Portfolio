class CreateOperationPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :operation_plans do |t|
      t.date :start_on
      t.date :completion_on
      t.boolean :remind
      t.string :task
      t.references :impulse_purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
