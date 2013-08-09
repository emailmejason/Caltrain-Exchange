class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.time :time_start
      t.time :time_end
      t.time :usage

      t.timestamps
    end
  end
end
