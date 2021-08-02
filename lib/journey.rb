class Journey
    attr_accessor :reader
  def initialize(started_at)
    @started_at = started_at
    @reader = {started_at: @started_at,
    started_at_time: Time.now.to_i,
    fare: :none,
    ended_at: :none,
    ended_at_time: :none}
  end

end