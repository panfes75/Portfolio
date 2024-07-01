class CreateSocailProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :socail_profiles do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
