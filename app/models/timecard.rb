class Timecard < ActiveRecord::Base

  attr_accessible :volunteer_date, :start_time, :end_time, :formatted_date

  belongs_to :user

  def formatted_date=(dt)
    self.volunteer_date = DateTime.strptime(dt, "%m/%d/%Y")
  end

  def formatted_date
    self.volunteer_date.to_formatted_s( :short_ordinal ) unless self.volunteer_date.nil?
  end

end


# == Schema Information
#
# Table name: timecards
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  volunteer_date :datetime
#  start_time     :datetime
#  end_time       :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

