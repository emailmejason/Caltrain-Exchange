class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  has_one :share

  attr_accessible :off_station, :on_station, :train_id, :user_id, :on_station_time, :off_station_time

  def self.decimal_time(x)
    (x.split(':')[1].to_f/60) + (x.split(':')[0].to_f)
  end

  def on_time
    Offer.decimal_time(self.on_station_time)
  end

  def off_time
    Offer.decimal_time(self.off_station_time)
  end

  def duration
    off_time - on_time
  end
end
