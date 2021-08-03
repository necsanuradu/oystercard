require './lib/user_terminal.rb'
require './lib/station_terminal_out.rb'
require './lib/station_terminal_in.rb'
require './lib/journey.rb'
require './lib/price_maker.rb'

class Oystercard
  attr_accessor :balance, :journeys
  attr_reader :terminal
  BALANCE = 500
  def initialize(balance = BALANCE, history = Array.new)
    @balance = balance
    @journeys = Array.new
  end

  def connect_user_terminal(terminal = User_Terminal.new)
    @terminal = terminal
  end

  def tap_in(terminal = Station_Terminal_In.new)
    terminal.tap_in(self)
  end

  def tap_out(terminal = Station_Terminal_Out.new)
    terminal.tap_out(self)
  end
end