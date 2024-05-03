class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
  end
end
