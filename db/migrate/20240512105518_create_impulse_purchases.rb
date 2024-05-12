class CreateImpulsePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :impulse_purchases do |t|
      t.string :title, null: false
      t.integer :purchase_amount, null: false
      t.integer :hourly_wage, null: false
      t.time :operating_time, null: false
      t.string :comment
      t.integer :privacy
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
