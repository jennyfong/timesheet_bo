module TimeLogsHelper

  def hours_interval
    list = []

    for i in 0..24 do
      list << "%02d" %i
    end

    list
  end

  def minute_interval
    list = []
    for i in 0..60 do
      list << "%02d"%i
    end
    list
  end

end
