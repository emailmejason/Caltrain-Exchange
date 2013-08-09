class Additagain < ActiveRecord::Migration
  def up
    add_column :trips, :usage, :time
  end

  def down
  end
end
