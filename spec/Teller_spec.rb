# frozen_string_literal: true

require 'teller'
require 'stringio'

describe Teller do
  let(:customer_name){ 'Alice' }

  before(:each) do
    # new teller, gladys, with a customer, alice
    @teller = Teller.new(customer_name)
  end

  after(:each) do
    $stdin = STDIN # restored to prevent issues
  end

  it 'initialises with attribute' do
    expect(@teller).to be_instance_of(Teller)
    expect(@teller).to respond_to(:customer)
  end

  describe '#present_options' do
    it 'provides options' do
      expect { @teller.present_options }.to output("enter 'deposit'," \
      " 'withdraw', 'balance', 'statement', or 'quit'\n").to_stdout
    end
  end

  describe '#goodbye' do
    it 'thanks the customer by name' do
      expect { @teller.goodbye(@teller.customer.name) }.to output('thanks,' \
        " Alice, and have a great day!\n").to_stdout
    end
  end

  describe '#session' do
    # let(:deposit_str) { StringIO.new('deposit') }
    # let(:deposit) { StringIO.new('-20') }
    # let(:quit) { StringIO.new('quit') }

    # ^ correctly formatted.
    # xit "reaches 'present options' stage" do
    #   $stdin = deposit_str
    #   expect (@teller.session).to eq('how muchh')
    #
    # end

    it 'can show balance and quit' do
      # @teller.stub(:gets) {'quit'} # OUTDATED
      #SUCCESSFUL MOCK
      allow(@teller).to receive(:gets).and_return('balance','quit')
      # expect(@teller.session).to output("HHHH\n").to_stdout #WRONG SYNTAX, don't use this
      expect { @teller.session }.to output("HHHH\n").to_stdout

      # @teller.session
      # allow($stdin).to receive(:gets).and_return('deposit')
      # deposit_req = $stdin.gets
      # expect { @teller.session }.to output("HSSSSS").to_stdout
    end
  end
end

# TELLER tests

# has a method called show_statement
# show_statement contains credit history
# show_statement contains debit history
# show_statement contains balance
# show_statement contains date
# if I make three transactions, they are shown in rev_chron order
# multiple transactions over multiple days are recorded correctly

# has a method called show_balance
# show_statement contains my most recent balance
