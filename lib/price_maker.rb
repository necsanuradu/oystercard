class Price_Maker
  def set_value(journey, to_station, to_zone)
    @from_station = journey.content_view[:from_station]
    @from_zone = journey.content_view[:from_zone]
    @from_time = journey.content_view[:from_time]
    @to_station = to_station
    @to_zone = to_zone
    @to_time = Time.now.to_i
    return 300
  end
end
