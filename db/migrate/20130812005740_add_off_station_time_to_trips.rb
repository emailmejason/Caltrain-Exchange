class AddOffStationTimeToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :off_station_time, :string
  end
end
