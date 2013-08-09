class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :trip_id
      t.string :arrival_time
      t.string :departure_time
      t.string :stop_id

      t.timestamps
    end
  end
end
