class Addusagewithcorrectdatatype < ActiveRecord::Migration
  def up
    add_column :trips, :usage, :interval

  end

  def down
  end
end
