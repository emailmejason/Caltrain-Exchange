class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :train

  attr_accessible :off_station, :on_station, :train_id, :user_id, :wifi_duration
end
