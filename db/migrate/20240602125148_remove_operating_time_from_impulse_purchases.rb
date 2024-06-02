class RemoveOperatingTimeFromImpulsePurchases < ActiveRecord::Migration[7.1]
  def change
    remove_column :impulse_purchases, :operating_time, :time
  end
end
