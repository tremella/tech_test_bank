require 'Teller'
require 'stringio'
require_relative '../lib/messages.rb'


describe Teller do

  before(:each) do
    # new teller, gladys, with a customer, alice
    @gladys = Teller.new('Alice')
  end

  describe '#welcome' do
    it 'greets and provides options' do
      expect { @gladys.welcome }.to output("enter 'deposit' to deposit, enter 'withdraw' to withdraw, enter 'balance' for balance, or enter 'statement' for a statement\n").to_stdout
    end
  end



end

# is instance of self
# does greet and options
# successfully puts 'how much'
#
#
#
