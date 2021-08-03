class Station_Terminal_Out
  def subtract_balance(card, amount)
    @card = card
    @amount = amount
    raise_barrier
    @card.balance -= @amount
  end
  
  def raise_barrier
    puts "Thank you, for traveling with us!"
  end

end