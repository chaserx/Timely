class ChangeTimeOut < ActiveRecord::Migration
  def self.up
      change_column(:punches, :timeOut, :datetime)
  end

  def self.down
    change_column(:punches, :timeOut, :time)
  end
end
