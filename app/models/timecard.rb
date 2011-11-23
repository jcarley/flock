class Timecard < ActiveRecord::Base

  belongs_to :user

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

