module ApplicationHelper

  def humanize_time(time_in_second=0)

    Time.at(time_in_second).gmtime.strftime("%H hrs %M mins")


  end

  def default_hour(time_log)
    if time_log.start_time
      time_log.start_time.strftime("%H")
    else
      "%02d"% Time.current.hour
    end

  end

  def default_minute(time_log)
    if time_log.start_time
      time_log.start_time.strftime("%M")
    else
      "%02d"% Time.current.min
    end

  end

end
