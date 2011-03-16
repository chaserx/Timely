class Punch < ActiveRecord::Base
  
  
  before_save :graceful_rounding, :calculate_clock_out
  
  
  
  def calculate_clock_out
    time = self.timeIn
    time += 8.5.hours
    
    self.timeOut = time
  end
  
  def graceful_rounding
    
    time = self.timeIn.min
    
    if time == 00
      return
    elsif (1..7).cover?(time)
      return self.timeIn -= (time*60)
    elsif (8..14).cover?(time)
      return self.timeIn += (15 - time)*60
    elsif time == 15
      return
    elsif (16..22).cover?(time)
      return self.timeIn -= (time -15)*60
    elsif (23..29).cover?(time)
      return self.timeIn += (30 - time)*60
    elsif time == 30
      return
    elsif (31..37).cover?(time)
      return self.timeIn -= (time - 30)*60
    elsif (38..44).cover?(time)
      return self.timeIn += (45 - time)*60
    elsif time == 45
      return
    elsif (46..52).cover?(time)
      return self.timeIn -= (time - 45)*60
    elsif (53..59).cover?(time)
      return self.timeIn += (60 - time)*60
    else
      raise 'value of time.min not between 00..59'
    end
    
  end
end
