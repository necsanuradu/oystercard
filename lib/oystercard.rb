require "./lib/user_terminal.rb"

class Oystercard
  attr_accessor :balance, :terminal
  attr_reader :max_balance

  BALANCE = 500
  MAX_BALANCE = 10000

  def initialize(balance = BALANCE, history = Array.new)
    @balance = balance
    @history = history
    @max_balance = MAX_BALANCE
  end

  def connect_user_terminal(terminal = User_Terminal.new)
    @terminal = terminal
  end
end