class ChangeDateToImpulsePurchase < ActiveRecord::Migration[7.1]
  def change
    change_column :impulse_purchases, :operating_time, :numeric
  end
end
