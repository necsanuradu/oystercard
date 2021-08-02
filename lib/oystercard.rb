require './lib/user_terminal.rb'
require './lib/station_terminal_out.rb'
require './lib/station_terminal_in.rb'
require './lib/journey.rb'
require './lib/price_maker.rb'

class Oystercard
  attr_accessor :balance, :terminal
  attr_reader :max_balance

  BALANCE = 500
  MAX_BALANCE = 10000
  def initialize(balance = BALANCE, history = Array.new)
    @balance = balance
    @history = history
    @max_balance = MAX_BALANCE
    @journeys = Array.new
  end

  def connect_user_terminal(terminal = User_Terminal.new)
    @terminal = terminal
  end

  def tap_in(terminal = Station_Terminal_In.new)
    @terminal = terminal
    raise_errors_verify_balance_in
    @journey = start_journey
    @journeys.push(@journey)
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

  def raise_errors_verify_balance_in
    @journey = (@journeys.empty?) ? :none : @journeys.last
    @terminal.verify_ballance(self)
    raise "Please seek assistance from a member of staff" if last_journey_not_complete?
  end

  def start_journey
    Journey.new(@terminal)
  end

  def complete_journey
    @journey.content_view[:ended_at_time] = Time.now.to_i
    @journey.content_view[:ended_at] = @terminal
    @journey.content_view[:fare] = @fare
  end

  def last_journey_not_complete?
    ((@journey != :none) && (@journey.content_view[:fare] == :none)) ? true : false
  end

  def last_journey_is_complete?
    ((@journey == :none) || (@journey.content_view[:fare] != :none)) ? true : false
  end

  def not_enough_balance?
    @balance < @fare
  end
end