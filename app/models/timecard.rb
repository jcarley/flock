class Timecard < ActiveRecord::Base

  attr_accessible :start_time_string, :end_time_string, :formatted_date

  belongs_to :user

  default_scope :order => 'volunteer_date'

  def formatted_date
    self.volunteer_date.to_formatted_s( :short_ordinal ) unless self.volunteer_date.nil?
  end

  def formatted_date=(dt)
    self.volunteer_date = DateTime.strptime(dt, "%m/%d/%Y")
  rescue ArgumentError
    @volunteer_date_invalid = true
  end

  def start_time_string
    self.start_time.strftime("%I:%M %P") unless self.start_time.nil?
  end

  def start_time_string=(start_time_str)
    self.start_time = DateTime.strptime(start_time_str, "%I:%M %P") 
  rescue ArgumentError
    @start_time_invalid = true
  end

  def end_time_string
    self.end_time.strftime("%I:%M %P") unless self.end_time.nil?
  end

  def end_time_string=(end_time_str)
    self.end_time = DateTime.strptime(end_time_str, "%I:%M %P")
  rescue ArgumentError
    @end_time_invalid = true
  end

  def total_time
    total = (self.end_time.to_i - self.start_time.to_i).to_f / 3600
    total.denominator == 1 ? total.to_i : total
  end

  def validate
    errors.add(:volunteer_date, "is invalid") if @volunteer_date_invalid
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

