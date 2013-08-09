class Train < ActiveRecord::Base
  attr_accessible :direction, :number, :schedule

  serialize :schedule, ActiveRecord::Coders::Hstore
end
