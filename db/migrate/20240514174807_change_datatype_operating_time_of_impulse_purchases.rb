class ChangeDatatypeOperatingTimeOfImpulsePurchases < ActiveRecord::Migration[7.1]
  def change
    change_column :impulse_purchases, :operating_time, 'integer USING (EXTRACT(EPOCH FROM operating_time))::integer'
  end
end
