require './lib/user_terminal.rb'
require './lib/station_terminal_out.rb'

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

  def tap_out(fare, terminal = Station_Terminal_Out.new)
    @terminal = terminal
    @terminal.subtract_balance(self, fare)
  end

  def tap_in(terminal = Station_Terminal_Out.new)
    @terminal = terminal
  end
end