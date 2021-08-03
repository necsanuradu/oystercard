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
    @history = history
    @journeys = Array.new
  end

  def connect_user_terminal(terminal = User_Terminal.new)
    @terminal = terminal
  end

  def tap_in(terminal = Station_Terminal_In.new)
    terminal.tap_in(self)
  end

  def tap_out(fare = Price_Maker.new, terminal = Station_Terminal_Out.new)
    @terminal = terminal
    raise_errors_verify_fare_out(fare)
    complete_journey
    @terminal.subtract_balance(self, @fare)
  end
  
  def raise_errors_verify_fare_out(fare)
    @journey = (@journeys.empty?) ? :none : @journeys.last
    raise "Please seek assistance from a member of staff" if last_journey_is_complete?
    fare.is_a?(Integer) ? @fare = fare : @fare = fare.get_price(@journey.content_view[:started_at], @terminal)
    raise "Not enough balance balace, please top-up" if not_enough_balance?
  end

  def complete_journey
    @journey.content_view[:ended_at_time] = Time.now.to_i
    @journey.content_view[:ended_at] = @terminal
    @journey.content_view[:fare] = @fare
    puts "Your journey started at #{@journey.content_view[:started_at].object_id} station"
  end

  def last_journey_is_complete?
    ((@journey == :none) || (@journey.content_view[:fare] != :none)) ? true : false
  end

  def not_enough_balance?
    @balance < @fare
  end
end