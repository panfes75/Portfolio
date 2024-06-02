class AddOperatingTimeToImpulsePurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :impulse_purchases, :operating_time, :decimal, null: false
  end
end
