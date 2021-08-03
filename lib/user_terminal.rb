class User_Terminal
    attr_reader :max_balance
    MAX_BALANCE = 900
  def initialize
    @max_balance = MAX_BALANCE
  end

  def add_balance(oystercard, amount = 1) # 1 pence
    @oystercard = oystercard
    @amount = amount
    raise "Maximum balance exceeded" if self.max_balance_exeded?
    @oystercard.balance += @amount
  end

  def max_balance_exeded?
    (@oystercard.balance + @amount > @max_balance) ? true : false
  end
end