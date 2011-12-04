module TimecardsHelper

  def availableTimes
    times = [];

    t = Time.parse("12:00am")

    48.times do
      times << t.strftime("%l:%M %P")
      t = t.advance(:minutes => 30)
    end

    times
  end

end
