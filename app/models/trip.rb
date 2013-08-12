class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :train

  attr_accessible :off_station, :on_station, :train_id, :user_id, :wifi_duration, :on_station_time, :off_station_time


# the original version of this method-(self.off_station_time.split(':')[1].to_f/60) +self.off_station_time.split(':')[0].to_f
  def self.decimal_time(x)
    (x.split(':')[1].to_f/60) + (x.split(':')[0].to_f)
  end

  def duration
    self.wifi_duration.to_f/60
  end

  def on_time
    Trip.decimal_time(self.on_station_time)
  end

  def off_time
    Trip.decimal_time(self.off_station_time)
  end

  # @my_trip.new_matching_offers
  #
  # Returns an array of Offer objects.
  def matching_offers
    offers_on_train = Offer.where(:train_id => train_id)

    # I will add matching offers to this array:
    matching_offers_array = []

    offers_on_train.each do |offer|

      # Prerequisite Check:
      if offer.duration >= duration && offer.on_time < (off_time - duration)

        # If passes prereqs, then either this group must pass...
        if offer.on_time <= on_time && offer.off_time >= (on_time + duration)
          matching_offers_array << offer

        # ...or this group must pass.
        elsif offer.on_time >= on_time && offer.off_time >= (off_time - duration)
          matching_offers_array << offer
        end
      end
    end

    matching_offers_array.uniq
  end

end

