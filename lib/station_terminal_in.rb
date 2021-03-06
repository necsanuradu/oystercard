class StationTerminalIn 
  MIN_FARE = 100

  def initialize(name, zone)
    @name = name
    @zone = zone
    @minimum_fare = MIN_FARE
  end

  def touch(oystercard)
    oystercard.in_journey = true
    @oystercard = oystercard
    (@journey = start_journey; @oystercard.journeys.push(@journey)) if raise_errors_tap_in?
  end

  def raise_errors_tap_in?
    (deduct(@oystercard, 600); return false) if last_journey_not_complete? 
    verify_minimum_required_ballance
    true
  end

  def start_journey
    Journey.new(@name, @zone)
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

  def deduct(oystercard, fare)
    raise_barrier
    oystercard.balance -= fare
  end

end