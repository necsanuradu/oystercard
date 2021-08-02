class User_Terminal
  def add_balance(card, amount = 1) # 1 pence
    @card = card
    @amount = amount
    raise "Maximum balance exceeded" if self.max_balance_exeded?
    @card.balance += @amount
  end

  def max_balance_exeded?
    (@card.balance + @amount > @card.max_balance) ? true : false
  end
end