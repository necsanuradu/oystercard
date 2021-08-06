require "./lib/price_maker.rb"
require './lib/station.rb'
describe Price_Maker do
  let(:station){ Station.new("Paddington", 1)}
  let(:journey){ double :journey }
  it "makes sure the fare has a value of 300 pence" do 
    allow(journey).to receive(:content_view).and_return({from_station: "Paddington", from_zone: 1, fare: :none})
    expect(subject.set_value(journey, "Finchley Central", 3)).to eq(300) # be_between(100,500)
  end
end