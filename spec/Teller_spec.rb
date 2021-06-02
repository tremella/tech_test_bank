require 'Teller'
require 'stringio'
# require_relative '../lib/messages.rb'


describe Teller do

  before(:each) do
    # new teller, gladys, with a customer, alice
    @gladys = Teller.new('Alice')
    allow(@gladys).to receive(:gets).and_return('quit')
  end

  it 'initialises with attribute' do
    expect(@gladys).to be_instance_of(Teller)
    expect(@gladys).to respond_to(:customer)
  end

  describe '#present_options' do
    it 'provides options' do
      expect { @gladys.present_options }.to output("enter 'deposit' to deposit, 'withdraw' to withdraw, 'balance' for balance, 'statement' for a statement, or 'quit' to leave\n").to_stdout
    end
  end

  describe '#session' do
    it 'greets customer by name' do
      expect { @gladys.session }.to output("Welcome, Alice\n").to_stdout
    end


  end

  describe '#goodbye' do
    it 'thanks the customer by name' do
      expect { @gladys.goodbye(@gladys.customer.name) }.to output("thanks, Alice, and have a great day!\n").to_stdout
    end
  end

  # let(:input) { StringIO.new('20') }
  #
  # it 'alters the balance (zero balance acct)' do
  #   $stdin = input
  #   expect { @alice.make_deposit }.to output("how much?\n")
  #   .to_stdout.and change { @alice.balance }.to(20)
  # end


end

# is instance of self
# does greet and options
# successfully puts 'how much'
#
#
#
# TELLER tests

# acct has a method called show_statement
# show_statement contains credit history
# show_statement contains debit history
# show_statement contains balance
# show_statement contains date
# if I make three transactions, they are shown in rev_chron order
# multiple transactions over multiple days are recorded correctly

# acct has a method called show_balance
# show_statement contains my most recent balance
# show_statement contains my current date
