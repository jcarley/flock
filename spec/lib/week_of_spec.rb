require 'spec_helper'

describe WeekOf do

  describe "week_of" do

    it "returns the proper beginning and end of the week" do
      week = WeekOf.week_of 0, Date.new(2011, 11, 9)
      week[:beginning].should == Date.new(2011, 11, 6)
      week[:end].should == Date.new(2011, 11, 12)
    end

    it "returns the proper beginning and end of next week" do
      week = WeekOf.week_of 1, Date.new(2011, 11, 9)
      week[:beginning].should == Date.new(2011, 11, 13)
      week[:end].should == Date.new(2011, 11, 19)
    end

    it "returns the proper beginning and end of previous week" do
      week = WeekOf.week_of -1, Date.new(2011, 11, 9)
      week[:beginning].should == Date.new(2011, 10, 30)
      week[:end].should == Date.new(2011, 11, 5)
    end

  end

end
