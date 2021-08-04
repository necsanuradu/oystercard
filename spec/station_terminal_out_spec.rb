require "./lib/station_terminal_out.rb"

describe Station_Terminal_Out do 
  it "makes sure that deduct is a method of Station_Terminal_Out" do
    expect(subject).to respond_to :deduct
  end
end