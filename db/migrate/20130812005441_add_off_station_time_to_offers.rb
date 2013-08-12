class AddOffStationTimeToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :off_station_time, :string
  end
end
