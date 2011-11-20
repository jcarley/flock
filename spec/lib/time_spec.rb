require 'spec_helper'

describe Time do

  describe "kw" do

    it "returns the week of the year for a given date" do
      today = Time.new(2011, 11, 19)
      today.kw.should == 46
    end

    it "returns the day that is the beginning of the week" do
      Time.newkw(21, 2011).strftime("%x").should == Time.new(2011, 05, 22).strftime("%x")
    end

  end
end

