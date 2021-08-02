class User_Terminal
  def add_balance(card, amount = 1) # 1 pence
    new_balance = card.balance + amount
    raise "Maximum balance exceeded" if new_balance > card.max_balance
    card.balance += amount
  end
end