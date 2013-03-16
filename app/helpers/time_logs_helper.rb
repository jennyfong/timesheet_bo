module TimeLogsHelper
  def short_cut(button_name)
    truncate(button_name, :length => 30)
  end


end
