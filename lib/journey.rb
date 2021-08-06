class Journey
  attr_accessor :content_view 

  def initialize(from_station, from_zone)
    @content_view = {from_station: from_station, from_zone: from_zone,
    from_time: Time.now.to_i,
    to_station: :none, to_zone: :none, to_time: :none,fare: :none}
  end

end
