class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.integer :train_id
      t.string :on_station
      t.string :off_station

      t.timestamps
    end
  end
end
