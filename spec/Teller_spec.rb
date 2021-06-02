require 'Teller'
require 'stringio'
require_relative '../lib/messages.rb'


describe Teller do

  before(:each) do
    # new teller, gladys, with a customer, alice
    @gladys = Teller.new('Alice')
  end

  it 'initialises with attribute' do
    expect(@gladys).to be_instance_of(Teller)
    expect(@gladys).to respond_to(:customer)
  end

  describe '#welcome' do
    it 'greets and provides options' do
      expect { @gladys.welcome }.to output("enter 'deposit' to deposit, enter 'withdraw' to withdraw, enter 'balance' for balance, or enter 'statement' for a statement\n").to_stdout.and change { pick }.to ('deposit')
    end
  end



end

# is instance of self
# does greet and options
# successfully puts 'how much'
#
#
#
