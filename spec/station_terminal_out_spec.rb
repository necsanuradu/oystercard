require "./lib/oystercard.rb"
require "./lib/station_terminal_out.rb"
describe Station_Terminal_Out do 
  subject{ described_class.new("Paddington", 1) }
  let(:oystercard){ Oystercard.new }
  it "shows that terminal out has a method touch" do
    expect(subject).to respond_to :touch
  end
  it "makes sure that deduct is a method of Station_Terminal_Out" do
    expect(subject).to respond_to :deduct
  end
  it "it should deduct 100 pence from the oystercard balance" do
    expect{ subject.deduct(oystercard, 100) }.to change{oystercard.balance}.by(-100)
  end
end