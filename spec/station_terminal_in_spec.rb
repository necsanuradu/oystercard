require "./lib/station_terminal_in.rb"
describe Station_Terminal_In do
  it "makes sure that touch_in is a method of Station_Terminal_In" do
    expect(subject).to respond_to :touch_in
  end
end