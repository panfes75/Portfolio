class ChangeCloumnsNotnullOperatingTimeImpulsePurchases < ActiveRecord::Migration[7.1]
  def up
    change_column_null :impulse_purchases, :operating_time, false, 0
  end

  def down
    change_column_null :impulse_purchases, :operating_time, true, nill
  end
end
