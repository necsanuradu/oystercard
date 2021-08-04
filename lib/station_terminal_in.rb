class Station_Terminal_In
  MIN_FARE = 100
  def initialize 
    @minimum_fare = MIN_FARE
  end

  def touch_in(oystercard)
    oystercard.in_journey = true
    @oystercard = oystercard
    raise_errors_tap_in
    @journey = start_journey
    @oystercard.journeys.push(@journey)
  end

  def raise_errors_tap_in
    verify_minimum_required_ballance
    raise "Please seek assistance from a member of staff" if last_journey_not_complete?
  end

  def start_journey
    Journey.new(self)
  end

  def last_journey_not_complete?
    (!@oystercard.journeys.empty? && (@oystercard.journeys.last.content_view[:fare] == :none)) ? true : false
  end

  def verify_minimum_required_ballance
    raise "Please top-up, not enough credit" if @oystercard.balance < @minimum_fare
    raise_barrier
  end

  def raise_barrier
    puts "Thank you, please enjoy your journey!"
  end
end