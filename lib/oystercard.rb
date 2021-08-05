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

end
