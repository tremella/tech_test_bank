
require 'Account'

describe Account do

  subject(:alice) { Account.new('Alice')}

  # acct is instance of Account class
  # acct has an account_holder_name
  it 'initialises with a name' do
    expect(alice).to be_instance_of(Account)
    expect(alice.name).to eq('Alice')
  end


end

  #
  # it 'implements roll' do
  #   expect(Dice.new).to respond_to(:roll)
  # end

# acct has a transaction_history
# transaction_history is blank when new

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
