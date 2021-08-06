class Price_Maker

  def set_value(journey, to_station, to_zone, to_time = Time.now.to_i)
    journey = journey.content_view
    @from_zone, @from_time, @from_station = journey[:from_zone], journey[:from_time], journey[:from_station]
    return 300 # until we get set value how to..xwwxw
  end

end
