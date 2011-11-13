class DashboardController < ApplicationController
  def index
    @week_of = this_week
  end

  private

  def this_week
    week_of
  end

  def week_of(week = 0)
    day_offset = week * 7
    today = Date.today.advance :days => day_offset
    beginning_of_week = today.sunday? ? today : today.beginning_of_week.advance( :days => -1 )
    end_of_week = beginning_of_week.advance :days => 6
    "#{beginning_of_week.to_formatted_s :short} - #{end_of_week.to_formatted_s :short}"
  end

end
