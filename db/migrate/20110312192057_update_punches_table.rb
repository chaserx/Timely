class UpdatePunchesTable < ActiveRecord::Migration
  def self.up
    change_column(:punches, :timeIn, :time)
    remove_column :punches, :timeOut
  end

  def self.down
    add_column :punches, :timeOut, :datetime
    change_column(:punches, :timeIn, :datetime)
  end
end
