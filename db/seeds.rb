# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



file_path = Rails.root.join("public", "stop_times.csv").to_s
trains = Roo::Spreadsheet.open(file_path)

trains_hash = {}

# {
#   "101" => {
#     "11:21:00" => "San Jose Caltrain",
#     "11:22:00" => "Santa Clara Caltrain",
#     "11:23:00" => "Bayshore Caltrain"
#   },
#   "102" => {
#     "11:21:00" => "San Jose Caltrain",
#     "11:22:00" => "Santa Clara Caltrain",
#     "11:23:00" => "Bayshore Caltrain"
#   }
# }

def convert_train_string_into_train_number(train_string)

  train_string[0...3]
end



trains.each_with_index({:train => "trip_id", :time => "arrival_time",  :station => "stop_id"}) do |row_hash, i|
  if i > 0
    long_train_number = row_hash[:train]
    short_train_number = convert_train_string_into_train_number(long_train_number)

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