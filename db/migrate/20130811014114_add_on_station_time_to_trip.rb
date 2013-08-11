class AddOnStationTimeToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :on_station_time, :string
  end
end
