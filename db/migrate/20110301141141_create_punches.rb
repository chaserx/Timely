class CreatePunches < ActiveRecord::Migration
  def self.up
    create_table :punches do |t|
      t.datetime :timeIn
      t.datetime :timeOut

      t.timestamps
    end
  end

  def self.down
    drop_table :punches
  end
end
