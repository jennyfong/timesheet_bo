module ApplicationHelper

  def humanize_time(time_in_second=0)

    Time.at(time_in_second).gmtime.strftime("%H hrs %M mins")


  end

end
