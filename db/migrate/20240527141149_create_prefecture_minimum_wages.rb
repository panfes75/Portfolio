class CreatePrefectureMinimumWages < ActiveRecord::Migration[7.1]
  def change
    create_table :prefecture_minimum_wages do |t|
      t.string :name, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
