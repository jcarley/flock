class DashboardController < ApplicationController
  def index
    @week_of = ::WeekOf.this_week_s
  end
end
