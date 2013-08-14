class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :trip_id
      t.integer :offer_id
      t.integer :wifi_rating
      t.integer :user_rating
      t.string :network_name
      t.string :network_password

      t.timestamps
    end
  end
end
