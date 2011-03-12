class ChangePunchesTable < ActiveRecord::Migration
  def self.up
    change_column(:punches, :timeIn, :datetime)
  end

  def self.down
    change_column(:punches, :timeIn, :time)
  end
end
