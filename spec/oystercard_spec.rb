require "./lib/oystercard.rb"
describe Oystercard do
  it "makes sure all oystercards start with a 500 balance" do
    expect(subject.balance).to eq(500)
  end

  it "would add 200 balance increasing the default balance of 500 pence" do
    expect{ subject.add_balance(200) }.to change{ subject.balance }.by 200
  end

  it "should prevent the user from adding too much money" do
    expect {subject.add_balance(9501)}
    .to raise_error 'Maximum balance exceeded'
  end

  it "shows that Oystercard has a method called tap_in and tap_out" do
    expect(subject).to respond_to :tap_in
    expect(subject).to respond_to :tap_out
  end

  it "should allow the fare to be deducted from the card when journey is complete" do
    subject.tap_in
    balance = subject.balance
    expect(subject.tap_out).not_to be(balance)
  end

  it "should raise error since we are tapping out without tapping in before" do
    expect{ subject.tap_out }
    .to raise_error("Please seek assistance from a member of staff")
  end

  it "should raise error since we are tapping in twice without tapping out in between" do
    subject.tap_in
    expect{ subject.tap_in }
    .to raise_error("Please seek assistance from a member of staff")
  end

  it "check the minimum amount for a single journey and raises an error" do
    subject.balance = 0
    expect{ subject.tap_in }
    .to raise_error("Please top-up, not enough credit")
  end

  it "shows where I've travelled from" do
    from = Station_Terminal_In.new
    subject.tap_in(from)
    expect(subject.journeys.last.content_view[:from_station].object_id).to eq(from.object_id)
  end
end

=begin
    describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }
    end
    it 'should top_up the balance' do 
        expect{ card.top_up 1}.to change{card.balance }.by 1
    end
=end