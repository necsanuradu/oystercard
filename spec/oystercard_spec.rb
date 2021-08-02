require "./lib/oystercard.rb"
describe Oystercard do
  it "makes sure all oystercards start with a 500 balance" do
    expect(subject.balance).to eq(500)
  end

  it "would add 200 balance to the card having default balance of 500 pence" do
    expect(subject.connect_user_terminal.add_balance(subject, 200)).to eq(700)
  end

  it "should prevent the user from adding too much money" do
    expect {subject.connect_user_terminal.add_balance(subject, 9501)}
    .to raise_error 'Maximum balance exceeded'
  end

  it "should allow the fare to be deducted from the card" do
    expect(subject.tap_out(500)).to eq(0)
  end
end