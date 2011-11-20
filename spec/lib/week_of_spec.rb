require 'spec_helper'

describe WeekOf do

  describe "week_of" do

    it "returns the proper beginning and end of the week" do
      week = WeekOf.week_of 0, Date.new(2011, 11, 9)
      week.first.should == Date.new(2011, 11, 6)
      week.last.should == Date.new(2011, 11, 12)
    end

    it "returns the proper beginning and end of next week" do
      week = WeekOf.week_of 1, Date.new(2011, 11, 9)
      week.first.should == Date.new(2011, 11, 13)
      week.last.should == Date.new(2011, 11, 19)
    end

    it "returns the proper beginning and end of previous week" do
      week = WeekOf.week_of -1, Date.new(2011, 11, 9)
      week.first.should == Date.new(2011, 10, 30)
      week.last.should == Date.new(2011, 11, 5)
    end

    #it "returns a week for a given date" do

      #get a week from todays date
      #week = Week.new Time.new(2011, 11, 19)
      #week.kw.should == 46
      #week.days.first.should == Date.new(2011, 11, 13)
      #week.days.last.should == Date.new(2011, 11, 19)

    #end

    #it "returns a week for a given week index of the year" do

      #week = Week.newkw 46, 2011
      #week.kw.should == 46
      #week.days.first.should == Date.new(2011, 11, 13)
      #week.days.last.should == Date.new(2011, 11, 19)

    #end

  end

end
