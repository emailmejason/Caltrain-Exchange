class AddOnStationTimeToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :on_station_time, :string
  end
end
