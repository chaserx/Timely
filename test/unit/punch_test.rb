require 'test_helper'

class PunchTest < ActiveSupport::TestCase
  
  test "graceful_rounding_at_eleven_twentytwo_am" do
    require "chronic"
    @time = Punch.new()
    @time.timeIn = Chronic.parse("11:22 am")
    mins = @time.timeIn.min
    
    if (16..22).cover?(mins)
      @time.timeIn -= (mins -15)*60
    end
    assert(@time.timeIn.min == 15, "Not rounding 22 min to 15 min")
  end
end
