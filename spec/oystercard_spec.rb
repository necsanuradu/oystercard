require "./lib/oystercard.rb"
describe Oystercard do  
  let(:station){ Station.new("Stratford", 4) }
  let(:station_from){ Station.new("Paddington", 1) }
  let(:station_to){ Station.new("North Finchley", 3) }
  it "makes sure all oystercards start with a 500 balance" do
    expect(subject.balance).to eq(500)
  end

  it "add 200 balance increasing the default balance of 500 pence" do
    expect{ station.user_terminal.add_balance(subject, 200) }
    .to change{ subject.balance }.by 200
  end

  it "should prevent the user from adding too much money" do
    expect {station.user_terminal.add_balance(subject, 9501)}
    .to raise_error 'Maximum balance exceeded'
  end

  it "shows the in_journey status being changed by touch at terminal_in"  do
    station.terminal_in.touch(subject)
    expect(subject.in_journey).to eq(true)
  end

  it "shows the in_journey status being changed by touch at terminal_out" do
    station.terminal_in.touch(subject)
    station.terminal_out.touch(subject)
    expect(subject.in_journey).to eq(false)
  end

  it "allow the fare to be deducted from the card when journey is complete" do
    station.terminal_in.touch(subject)
    expect{ station.terminal_out.touch(subject) }
    .to change{ subject.balance }.by(-300)
  end

  context 'tapping out without tapping in' do
    it "should charge a penalty fare in the amopunt of 600" do
      station_from.terminal_in.touch(subject)
      station_to.terminal_out.touch(subject)
      expect{ station.terminal_out.touch(subject) }
      .to change{ subject.balance }.by(-600)
    end
  end

  context "when tapping in twice without tapping out in between" do
    it "should charge a penalty fare in the amount of 600" do
      station.terminal_in.touch(subject)
      expect{ station.terminal_in.touch(subject) }
      .to change{ subject.balance }.by(-600)
    end
  end

  context "when touch at terminal_in" do
    it "check the minimum amount for a single journey and raises an error" do
      subject.balance = 0
      expect{ station.terminal_in.touch(subject) }
      .to raise_error("Please top-up, not enough credit")
    end
  end

  it "shows where I've travelled from" do
    station_from.terminal_in.touch(subject)
    expect(subject.journeys.last.content_view[:from_station])
    .to eq("Paddington")
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
