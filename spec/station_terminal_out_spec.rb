require "./lib/station_terminal_out.rb"

describe Station_Terminal_Out do 
  it "makes sure that subtract_balance is a method of Station_Terminal_Out" do
    expect(subject).to respond_to :subtract_balance
  end
end