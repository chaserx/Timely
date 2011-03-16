class AddTimeOutToPunches < ActiveRecord::Migration
  def self.up
    add_column :punches, :timeOut, :time
  end

  def self.down
    remove_column :punches, :timeOut
  end
end
