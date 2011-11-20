class CreateTimecards < ActiveRecord::Migration
  def self.up
    create_table :timecards do |t|
      t.integer :user_id
      t.datetime :volunteer_date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :timecards
  end
end
