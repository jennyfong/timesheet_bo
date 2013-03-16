module ApplicationHelper


  def short_time(time)
    begin
      time.strftime('%I:%M %P')
    rescue
      time
    end
  end

end
