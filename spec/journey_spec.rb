require "./lib/journey.rb"
describe Journey do 
  it "journey has an attribute content_view[:from_station] equal to Paddington" do
    subject = described_class.new("Paddington", 1)
    expect(subject.content_view[:from_station]).to eq("Paddington")
  end
end