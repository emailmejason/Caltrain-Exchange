class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :train_id
      t.string :on_station
      t.string :off_station
      t.integer :wifi_duration

      t.timestamps
    end
  end
end
