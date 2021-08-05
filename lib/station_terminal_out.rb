class Station_Terminal_Out
  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  def touch_out(oystercard, fare = Price_Maker.new)
    oystercard.in_journey = false
    @oystercard = oystercard
    @fare = fare
    raise_errors_tap_out? ? complete_journey : nil
  end
  
  def raise_errors_tap_out?
    if last_journey_is_complete? 
      deduct(@oystercard, 600)
      return false
    end
    !@fare.is_a?(Integer) ? @fare = @fare.set_value(journey, @name, @zone) : nil
    raise "Not enough balance balace, please top-up" if not_enough_balance?
    puts "Your journey started at #{journey.content_view[:from_station].object_id} station"
    true
  end

  def complete_journey
    journey.content_view[:to_station] = @name
    journey.content_view[:to_time] = Time.now.to_i
    journey.content_view[:to_zone] = @zone
    journey.content_view[:fare] = @fare
    deduct(@oystercard, @fare)
  end

  def last_journey_is_complete?
    ((@oystercard.journeys.empty?) || (!@oystercard.journeys.empty?) && (journey.content_view[:fare] != :none)) ? true : false
  end

  def not_enough_balance?
    @oystercard.balance < @fare
  end

  def journey
    @oystercard.journeys.last
  end

  def deduct(oystercard, fare)
    raise_barrier
    oystercard.balance -= fare
  end

  def raise_barrier
    puts "Thank you, for traveling with us!"
  end

end