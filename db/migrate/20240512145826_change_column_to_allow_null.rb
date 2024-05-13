class ChangeColumnToAllowNull < ActiveRecord::Migration[7.1]
  def up
    change_column :impulse_purchases, :operating_time,:time, null: true
  end

  def down
    change_column :impulse_purchases, :operating_time,:time, null: false
  end
end
