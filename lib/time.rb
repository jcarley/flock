class Time
  def kw(wd=0)
    kw = self.strftime("%U").to_i
    kw -= 1 if self.wday < (wd%7)
    return kw
  end
  
  def self.newkw(kw=0, year=Time.now.year.to_i, wd=0)
    t = Time.local(year)
    (0..364).each do |n|
      if t.kw(wd) == kw; break; end
      t += 3600*24
    end
    return t
  end
end

