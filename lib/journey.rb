class Journey
    attr_accessor :content_view
  def initialize(started_at)
    @started_at = started_at
    @content_view = {started_at: @started_at,
    started_at_time: Time.now.to_i,
    fare: :none,
    ended_at: :none,
    ended_at_time: :none}
  end

end