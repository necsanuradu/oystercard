class Journey
    attr_accessor :content_view
  def initialize(from_station)
    @content_view = {
      from_station: from_station,
      from_time: Time.now.to_i,
      to_station: :none,
      to_time: :none,
      fare: :none
  }
  end
end