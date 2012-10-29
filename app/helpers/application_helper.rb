module ApplicationHelper


  def default_hour(input_time)
    if !input_time.blank?
      input_time.strftime("%H")
    else
      "%02d"% Time.current.hour
    end

  end

  def default_minute(input_time)
    if !input_time.blank?
      input_time.strftime("%M")
    else
      "%02d"% Time.current.min
    end

  end

end
