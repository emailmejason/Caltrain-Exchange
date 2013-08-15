
file_path = Rails.root.join("public", "stop_times1.csv").to_s
trains = Roo::Spreadsheet.open(file_path)

trains_hash = {}

# {
#   "101" => {
#     "11:21:00" => "San Jose Caltrain",
#     "11:22:00" => "Santa Clara Caltrain",
#     "11:23:00" => "Bayshore Caltrain"
#   }
# }

def shorten_the_train_number(train_string)

  train_string[0...3]
end



trains.each_with_index({:train => "trip_id", :time => "arrival_time",  :station => "stop_id"}) do |row_hash, i|
  if i > 0
    long_train_number = row_hash[:train]
    short_train_number = shorten_the_train_number(long_train_number)

    # Set a KEY in the trains_hash for this train - unless that train is already in the trains_hash.
    unless trains_hash.has_key?(short_train_number)
      trains_hash[short_train_number] = {}
    end

    # That key's value is a HASH. Meaning it is comprised of keys and values.

    # Add the time to that KEY's VALUE
    trains_hash[short_train_number][row_hash[:time]] = row_hash[:station]
  end
end

puts trains_hash

trains_hash.each do |x,y|
  train=Train.create!(:number=>x,:schedule=>y)
end

trains=Train.all

trains.each do |x|

  if x.number.to_i % 2 == 0
    x.update_attribute(:direction,"s")
  else
    x.update_attribute(:direction,"n")
  end


end

User.create!(username: "David Smith",email: "davidsmith@gmail.com", password:"1")
User.create!(username: "Michael Jones",email: "michaeljones@gmail.com", password:"1")
User.create!(username: "Chris Lee",email: "chrislee@gmail.com", password:"1")
User.create!(username: "Mike Lim",email: "mikelim@gmail.com", password:"1")
User.create!(username: "Mark Brown",email: "markbrown@gmail.com", password:"1")
User.create!(username: "Paul Williams",email: "paulwilliams@gmail.com", password:"1")
User.create!(username: "Dan Stewart",email: "danstewart@gmail.com", password:"1")
User.create!(username: "James Miller",email: "jamesmiller@gmail.com", password:"1")
User.create!(username: "Maria Johnson",email: "mariajohnson@gmail.com", password:"1")
User.create!(username: "John James",email: "johnjames@gmail.com", password:"1")


Trip.create!(user_id: 2, train_id:3 , on_station: "Mountain View", off_station: "Millbrae" , wifi_duration:"30" , on_station_time:"5:24" , off_station_time:"6:08" )



Offer.create!(user_id: 6, train_id:3 , on_station: "San Antonio", off_station: "San Francisco" , on_station_time:"5:28" , off_station_time:"6:36" )
Offer.create!(user_id: 3, train_id:3 , on_station: "Menlo Park", off_station: "Millbrae", on_station_time:"5:39" , off_station_time:"6:08" )
Offer.create!(user_id: 4, train_id:3 , on_station: "Mountain View", off_station: "Millbrae", on_station_time:"5:24" , off_station_time:"6:08" )
Offer.create!(user_id: 5, train_id:3 , on_station: "Tamien", off_station: "San Jose", on_station_time:"4:58" , off_station_time:"5:05" )






