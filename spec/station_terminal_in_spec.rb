require "./lib/station_terminal_in.rb"

describe StationTerminalIn do 
  subject(:terminal_in){ described_class.new("Paddington", 1) }
  it "touch is a method of Station_Terminal_In" do
    expect(terminal_in).to respond_to(:touch)
  end
end
