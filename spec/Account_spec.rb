
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
      .to_stdout.and change { @alice.balance }.to(20.0)
    end

    it 'alters the balance (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @tessa.balance }.to(120.0)
    end

    it 'alters the transaction history (zero balance acct)' do
      $stdin = input
      expect { @alice.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @alice.transaction_history }.to([[Time.now.strftime("%m/%d/%Y"), 20.0, 0.0, 20.0]])
    end

    it 'alters the transaction history (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_deposit }.to output("how much?\n")
      .to_stdout.and change { @tessa.transaction_history }.to([[Time.now.strftime("%m/%d/%Y"), 20.0, 0.0, 120.0]])
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
      .to_stdout.and change { @tessa.balance }.to(80.0)
    end

    it 'alters a the transaction history (non-zero balance acct)' do
      $stdin = input
      expect { @tessa.make_withdrawal }.to output("how much?\n")
      .to_stdout.and change { @tessa.transaction_history }.to([[Time.now.strftime("%m/%d/%Y"), 0.0, 20.0, 80.0]])
    end

    it 'throws an error for a withdrawal exceeding acct balance' do
      $stdin = input
      expect { @alice.make_withdrawal }.to output("how much?\n")
      .to_stdout.and raise_error 'insufficient balance'
    end

  end
end
