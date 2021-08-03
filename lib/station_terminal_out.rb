class Station_Terminal_Out
  
  def tap_out(oystercard, fare = Price_Maker.new)
    @oystercard = oystercard
    @fare = fare
    raise_errors_tap_out
    complete_journey
  end
  
  def raise_errors_tap_out
    raise "Please seek assistance from a member of staff" if last_journey_is_complete?
    !@fare.is_a?(Integer) ? @fare = @fare.set_value(journey, @terminal) : nil
    raise "Not enough balance balace, please top-up" if not_enough_balance?
    puts "Your journey started at #{journey.content_view[:from_station].object_id} station"
  end

  def complete_journey
    journey.content_view[:to_station] = self
    journey.content_view[:to_time] = Time.now.to_i
    journey.content_view[:fare] = @fare
    subtract_balance
  end

  def last_journey_is_complete?
    ((@oystercard.journeys.empty?) || (journey.content_view[:fare] != :none)) ? true : false
  end

  def not_enough_balance?
    @oystercard.balance < @fare
  end

  def journey
    @oystercard.journeys.last
  end

  def subtract_balance
    raise_barrier
    @oystercard.balance -= @fare
  end

  def raise_barrier
    puts "Thank you, for traveling with us!"
  end

end