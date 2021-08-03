class Station_Terminal_In
  MIN_FARE = 100
  def initialize 
    @min_fare = MIN_FARE
  end
  
  def verify_ballance(card)
    @card = card
    raise "Please top-up, not enough credit" if verify_ballance?
    raise_barrier
  end

  def verify_ballance?
    @card.balance < @min_fare
  end

  def raise_barrier
    puts "Thank you, please enjoy your journey!"
  end
end