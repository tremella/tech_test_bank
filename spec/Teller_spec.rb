# frozen_string_literal: true

require 'teller'
require 'stringio'

describe Teller do
  before(:each) do
    # new teller, gladys, with a customer, alice
    @gladys = Teller.new('Alice')
  end

  it 'initialises with attribute' do
    expect(@gladys).to be_instance_of(Teller)
    expect(@gladys).to respond_to(:customer)
  end

  describe '#present_options' do
    it 'provides options' do
      expect { @gladys.present_options }.to output("enter 'deposit'," \
      " 'withdraw', 'balance', 'statement', or 'quit'\n").to_stdout
    end
  end

  describe '#goodbye' do
    it 'thanks the customer by name' do
      expect { @gladys.goodbye(@gladys.customer.name) }.to output('thanks,' \
        " Alice, and have a great day!\n").to_stdout
    end
  end

  describe '#session' do
    # let(:deposit_str) { StringIO.new('deposit') }
    # let(:deposit) { StringIO.new('20') }
    # let(:quit) { StringIO.new('quit') }
    xit 'can deposit' do
      expect { @gladys.session }.to output("Welcome, Alice\n").to_stdout
      expect { @gladys.present_options }.to output("enter 'deposit'," \
        " 'withdraw', 'balance', 'statement', or 'quit'\n").to_stdout
      allow($stdin).to receive(:gets).and_return('quit')
    end
  end
end

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
