require 'spec_helper'

describe WeekOf do

  describe "week_of" do

    it "returns a hash for the beginning and end of the week" do

      week = WeekOf.week_of
      week[:beginning].sunday?.should be_true
      week[:end].saturday?.should be_true

    end

  end

end
