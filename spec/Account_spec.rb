
require 'Account'
require 'stringio'


describe Account do

  before(:each) do
    @alice = Account.new('Alice')
    @tessa = Account.new('Tessa',100) #a positive starting balance
  end

  it 'initialises with attributes' do
    expect(@alice).to be_instance_of(Account)
    expect(@alice).to respond_to(:name)
    expect(@alice).to respond_to(:balance)
    expect(@alice).to respond_to(:transaction_history)
  end

  describe '#make_deposit' do
    let(:input) { StringIO.new('20') }

    it 'alters the balance (zero balance acct)' do
      $stdin = input
      expect { @alice.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @alice.balance }.to(20)
    end

    it 'alters the balance (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @tessa.balance }.to(120)
    end

    it 'alters a the transaction history (zero balance acct)' do
      $stdin = input
      expect { @alice.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @alice.transaction_history }.to([[0, 20, 0, 20]])
    end

    it 'alters a the transaction history (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @tessa.transaction_history }.to([[0, 20, 0, 120]])
    end

    it 'throws an error for a deposit < 1' do
      $stdin = StringIO.new('0')
      expect { @tessa.make_deposit }.to output("how much?\n")
      .to_stdout.and raise_error 'invalid sum'
    end
  end

  describe '#make_withdrawal' do
    let(:input) { StringIO.new('20') }

    it 'alters the balance (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_withdrawal }.to output("how much?\n")
      .to_stdout.and change { @tessa.balance }.to(80)
    end

    it 'alters a the transaction history (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_withdrawal }.to output("how much?\n")
      .to_stdout.and change { @tessa.transaction_history }.to([[0, 0, 20, 80]])
    end

    it 'throws an error for a withdrawal exceeding acct balance' do
      $stdin = input
      expect { @alice.make_withdrawal }.to output("how much?\n")
      .to_stdout.and raise_error 'insufficient balance'
    end

  end
end

# TELLER tests
# if requested, balance is shown after deposit/withdrawal
# if NOT requested, balance is NOT shown after deposit/withdrawal

# acct has a method called make_withdrawal
# make_withdrawal alters transaction_history
# make_withdrawal raises error if insufficient funds


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
