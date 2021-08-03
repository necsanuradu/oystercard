class User_Terminal
    attr_reader :max_balance
    MAX_BALANCE = 900
  def initialize
    @max_balance = MAX_BALANCE
  end

  def add_balance(card, amount = 1) # 1 pence
    @card = card
    @amount = amount
    raise "Maximum balance exceeded" if self.max_balance_exeded?
    @card.balance += @amount
  end

  def max_balance_exeded?
    (@card.balance + @amount > @max_balance) ? true : false
  end
end