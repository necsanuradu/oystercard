class Station_Terminal_Out
  def subtract_balance(card, amount)
    new_balance = card.balance - amount
    raise "Can not have negative balace" if new_balance < 0
    card.balance -= amount
  end
end