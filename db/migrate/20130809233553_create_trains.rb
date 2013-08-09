class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :direction
      t.string :number
      t.hstore :schedule

      t.timestamps
    end
    add_hstore_index :trains, :schedule
  end
end
