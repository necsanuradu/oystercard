require './lib/station_terminal_out.rb'
require './lib/station_terminal_in.rb'
require './lib/user_terminal.rb'
class Station
  attr_reader :name, :zone, :terminal_in, :terminal_out, :user_terminal

  def initialize(name, zone)
    @name, @zone, @user_terminal = name, zone, User_Terminal.new
    @terminal_in = Station_Terminal_In.new(@name, @zone)
    @terminal_out = Station_Terminal_Out.new(@name, @zone)
  end
  
end
