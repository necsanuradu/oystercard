require "./lib/user_terminal.rb"
class Oystercard
  attr_accessor :balance, :terminal
  BALANCE = 500
  def initialize(balance = BALANCE, history = Array.new)
    @balance = balance
    @history = history
  end

  def connect_user_terminal(terminal = User_Terminal.new)
    @terminal = terminal
  end
end