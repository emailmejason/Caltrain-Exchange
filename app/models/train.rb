class Train < ActiveRecord::Base
  has_many :offers


  attr_accessible :direction, :number, :schedule

  serialize :schedule, ActiveRecord::Coders::Hstore
end
