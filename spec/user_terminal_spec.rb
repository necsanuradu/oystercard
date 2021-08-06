require "./lib/user_terminal.rb" 
describe UserTerminal do
  it "add_balance is a method of User_Terminal" do 
    expect(subject).to respond_to :add_balance
  end
  it "history is a method of UserTerminal" do 
    expect(subject).to respond_to :history
  end
end