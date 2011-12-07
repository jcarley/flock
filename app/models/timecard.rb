class Timecard < ActiveRecord::Base

  attr_accessible :volunteer_date, :start_time, :end_time, :formatted_date

  belongs_to :user

  def formatted_date=(dt)
    self.volunteer_date = DateTime.strptime(dt, "%m/%d/%Y")
  end

  def formatted_date
    self.volunteer_date.to_formatted_s( :short_ordinal ) unless self.volunteer_date.nil?
  end

  def start_time_string
    start_time.strftime("%I:%M %P")
  end

  def start_time_string=(start_time_str)
    self.start_time = Time.parse(start_time_str)
  rescue ArgumentError
    @start_time_invalid = true
  end

  def end_time_string
    end_time.strftime("%I:%M %P")
  end

  def end_time_string=(end_time_str)
    self.end_time = Time.parse(end_time_str)
  rescue ArgumentError
    @end_time_invalid = true
  end

  def validate
    errors.add(:start_time, "is invalid") if @start_time_invalid
    errors.add(:end_time, "is invalid") if @end_time_invalid
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

