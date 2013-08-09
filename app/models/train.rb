class Train < ActiveRecord::Base
  attr_accessible :arrival_time, :departure_time, :trip_id
end
