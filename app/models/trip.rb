class Trip < ActiveRecord::Base
  attr_accessible :time_end, :time_start, :usage, :user_id
  belongs_to :user
end
