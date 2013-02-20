require 'spec_helper'
require '/app/models/time_log'

describe TimeLog do
  it "should calculate duration when start_time and end_time are present" do
    log = TimeLog.new
    log.start_time = 2.hours.ago
    log.end_time = 2.hours.later
    log.duration.should == 4

  end
end