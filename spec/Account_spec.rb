
require 'Account'
require 'stringio'


describe Account do

  before(:each) do
    @alice = Account.new('Alice')
  end

  it 'initialises with attributes' do
    expect(@alice).to be_instance_of(Account)
    expect(@alice).to respond_to(:name)
    expect(@alice).to respond_to(:balance)
    expect(@alice).to respond_to(:transaction_history)
  end

  describe '#make_deposit' do
    let(:input) { StringIO.new('20') }
    it 'alters the balance' do
      $stdin = input
      expect { @alice.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @alice.balance }.to(20)
    end

    it 'alters the transaction history' do
      $stdin = input
      expect { @alice.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @alice.transaction_history }.to([[0, 20, 0, 20]])
    end
  end

end
# expect(@alice.transaction_history).to eq(['date || credit || debit || balance '],['
# 01/06/2021 || 10.00 || || 10.00'])


  #
  # it 'implements roll' do
  #   expect(Dice.new).to respond_to(:roll)
  # end


# acct has a method called make_deposit
# make_deposit alters transaction_history
# make_deposit raises error if input is 0
# if requested, balance is shown afterwards
# if NOT requested, balance is NOT shown afterwards

# acct has a method called make_withdrawal
# make_withdrawal alters transaction_history
# make_withdrawal raises error if insufficient funds
# if requested, balance is shown afterwards
# if NOT requested, balance is NOT shown afterwards

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
