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
    @transaction_history.push([Time.now.strftime("%m/%d/%Y"),sprintf('%.2f', sum),sprintf('%.2f', 0),sprintf('%.2f',@balance+sum)])
    # sprintf('%.2f', sum) turns '5' into '5.00'
    @balance += sum
  end

  def make_withdrawal
    puts 'how much?'
    sum = gets.chomp.to_f
    fail 'insufficient balance' if @balance-sum < 0
    @transaction_history.push([Time.now.strftime("%m/%d/%Y"),sprintf('%.2f', 0),sprintf('%.2f', sum),sprintf('%.2f',@balance-sum)])
    @balance -= sum
  end

end
