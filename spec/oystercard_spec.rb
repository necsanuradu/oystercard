require "./lib/oystercard.rb"
describe Oystercard do
  it "makes sure all oystercards start with a 500 balance" do
    expect(subject.balance).to eq(500)
  end

  it "would add 200 balance to the card having default balance of 500 pence" do
    expect(subject.connect_user_terminal.add_balance(subject, 200)).to eq(700)
  end
end