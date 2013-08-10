class Trip < ActiveRecord::Base
  attr_accessible :off_station, :on_station, :train_id, :user_id, :wifi_duration
end
