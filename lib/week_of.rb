module WeekOf

  def WeekOf.this_week_s
     the_week = week_of
     "#{the_week[:beginning].to_formatted_s :short} - #{the_week[:end].to_formatted_s :short}"
  end

  def WeekOf.week_of(week = 0, date = nil)
      day_offset = week * 7
      today = date.nil? ? Date.today : date
      today = today.advance :days => day_offset
      beginning_of_week = today.sunday? ? today : today.beginning_of_week.advance( :days => -1 )
      end_of_week = beginning_of_week.advance :days => 6
      week = { :beginning => beginning_of_week, :end => end_of_week }
    end
end
