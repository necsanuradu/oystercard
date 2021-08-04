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

  it "shows that Oystercard has a method called touch_in and touch_out" do
    expect(subject).to respond_to :touch_in
    expect(subject).to respond_to :touch_out
  end

  it "shows the in_journey? status being changed by touch_in"  do
    subject.touch_in
    expect(subject.in_journey?).to eq(true)
  end

  it "shows the in_journey? status being chenged by touch_out" do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq(false)
  end

  it "should allow the fare to be deducted from the card when journey is complete" do
    subject.touch_in
    balance = subject.balance
    expect(subject.touch_out).not_to be(balance)
  end

  context 'tapping out without tapping in' do
    it "should charge a penalty fare" do
      subject.touch_in
      subject.touch_out
      expect{ subject.touch_out }.to change{ subject.balance }.by(-6)
    end
  end

  it "should raise error since we are tapping in twice without tapping out in between" do
    subject.touch_in
    expect{ subject.touch_in }
    .to raise_error("Please seek assistance from a member of staff")
  end

  it "check the minimum amount for a single journey and raises an error" do
    subject.balance = 0
    expect{ subject.touch_in }
    .to raise_error("Please top-up, not enough credit")
  end

  it "shows where I've travelled from" do
    from = Station_Terminal_In.new
    subject.touch_in(from)
    expect(subject.journeys.last.content_view[:from_station].object_id).to eq(from.object_id)
  end

  it "it shows all previous trips" do 
    expect(subject.history).to eq (true)
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