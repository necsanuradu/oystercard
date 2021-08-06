class Station_Terminal_Out
   
  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  def touch(oystercard)
    @oystercard = oystercard
    @fare = Price_Maker.new
    complete_journey if raise_errors_tap_out? 
  end
  
  def raise_errors_tap_out?
    (deduct(@oystercard, 600); return false) if last_journey_is_complete? 
    raise "Not enough balance balace, please top-up" if not_enough_balance?
    true
  end

  def complete_journey(content = journey.content_view)
    content[:to_station], content[:to_station] = @name, Time.now.to_i
    content[:to_zone], content[:fare]  = @zone, @fare
    deduct(@oystercard, @fare)
  end

  def last_journey_is_complete?
    ((@oystercard.journeys.empty?) || (!@oystercard.journeys.empty?) && (journey.content_view[:fare] != :none)) ? true : false
  end

  def not_enough_balance?
    @fare = @fare.set_value(journey, @name, @zone)
    @oystercard.balance < @fare
  end

  def journey
    @oystercard.journeys.last
  end

  def deduct(oystercard, fare)
    oystercard.in_journey = false
    raise_barrier
    oystercard.balance -= fare
  end

  def raise_barrier
    puts "Thank you, for traveling with us!"
  end

end
