require './lib/station_terminal_out.rb'
require './lib/station_terminal_in.rb'
require './lib/user_terminal.rb'
class Station

  attr_reader :name, :zone, :terminal_in, :terminal_out
  attr_reader :user_terminal
  def initialize(name = ("a".."g").to_a.shuffle.join.capitalize, zone = rand(1..5))
    @name = name
    @zone = zone
    @terminal_in = Station_Terminal_In.new
    @terminal_out = Station_Terminal_Out.new
    @user_terminal = User_Terminal.new
  end
end
