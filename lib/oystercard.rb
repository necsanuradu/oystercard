require './lib/journey.rb'
require './lib/price_maker.rb'
require "./lib/station.rb"

class Oystercard
  attr_accessor :balance, :journeys, :in_journey
  attr_reader :terminal
  BALANCE = 500
  def initialize(balance = BALANCE, history = Array.new)
    @balance = balance
    @journeys = Array.new
    @in_journey = false
  end

  def add_balance(amount, terminal = User_Terminal.new)
    terminal.add_balance(self, amount)
  end

  def touch_in(terminal = Station_Terminal_In.new)
    terminal.touch_in(self)
  end

  def touch_out(terminal = Station_Terminal_Out.new)
    terminal.touch_out(self)
  end

  def in_journey?
    @in_journey
  end

  def history(terminal = User_Terminal.new)
    terminal.history(self)
  end
end