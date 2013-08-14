class Share < ActiveRecord::Base
  belongs_to :train
  belongs_to :offer
  attr_accessible :network_name, :network_password, :offer_id, :trip_id, :user_rating, :wifi_rating
end
