module WeekOf

  def WeekOf.this_week_s
     #"#{the_week.first.to_formatted_s :short} - #{the_week.last.to_formatted_s :short}"
     week_of
  end

  def WeekOf.week_of(week = 0, date = nil)
      day_offset = week * 7
      today = date.nil? ? Date.today : date
      today = today.advance :days => day_offset
      beginning_of_week = today.sunday? ? today : today.beginning_of_week.advance( :days => -1 )

      days = []

      days << beginning_of_week
      beginning_of_week.upto(beginning_of_week.advance :days => 6) do |day|
        days << day
      end

      days
    end
end
