require "./lib/user_terminal.rb"
describe User_Terminal do
  it "checks add_ballance is a method of UserTerminal" do 
    expect(subject).to respond_to :add_balance
  end
end