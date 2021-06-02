class Account

  attr_accessor:name, :balance, :transaction_history

  def initialize(name, balance = 0.0)
    @name = name
    @balance = balance
    @transaction_history = []
  end

  def make_deposit
    puts 'how much?'
    sum = gets.chomp.to_f
    fail 'invalid sum' if sum < 1
    @transaction_history.push([Time.now.strftime("%m/%d/%Y"),sum,0.0,(@balance+sum)])
    @balance += sum
  end

  def make_withdrawal
    puts 'how much?'
    sum = gets.chomp.to_f
    fail 'insufficient balance' if @balance-sum < 0
    @transaction_history.push([Time.now.strftime("%m/%d/%Y"),0.0,sum,(@balance-sum)])
    @balance -= sum
  end

end
