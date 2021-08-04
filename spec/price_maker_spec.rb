require "./lib/price_maker.rb"
require './lib/station_terminal_in.rb'
require './lib/station_terminal_out.rb'
require './lib/journey.rb'
describe Price_Maker do
  it "makes sure the fare hasa a value between 1 and 5 pounds" do 
    expect(subject.set_value(Journey.new(Station_Terminal_In.new),Station_Terminal_Out.new)).to be_between(100,500)
  end
end