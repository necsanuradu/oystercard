require 'station'

describe Station do 
  it 'should have a name and a zone' do
    subject = described_class.new("Kings Cross", 1)
    expect(subject).to have_attributes(:name => "Kings Cross", :zone => 1)
  end
end