class ChangeCloumnsNotnullAddImpulsePurchases < ActiveRecord::Migration[7.1]
  def change
    change_column_default :impulse_purchases, :operating_time, ""
    ImpulsePurchase.where(operating_time: nil).update_all(operating_time: "")
  end
end
