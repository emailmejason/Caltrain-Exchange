class Removeitagain < ActiveRecord::Migration
  def up
    remove_column :trips, :usage
  end

  def down
  end
end
