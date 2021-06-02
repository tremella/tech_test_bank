class Account

  attr_accessor:name, :balance, :transaction_history

  def initialize(name, balance = 0)
    @name = name
    @balance = balance
    @transaction_history = []
  end

  def make_deposit
    puts 'how much?'
    sum = gets.chomp.to_i
    fail 'invalid sum' if sum < 1
    @transaction_history.push([Time.now.strftime("%m/%d/%Y"),sum,0,(@balance+sum)])
    @balance += sum
  end

  def make_withdrawal
    puts 'how much?'
    sum = gets.chomp.to_i
    fail 'insufficient balance' if @balance-sum < 0
    @transaction_history.push([Time.now.strftime("%m/%d/%Y"),0,sum,(@balance-sum)])
    @balance -= sum
  end

  # one way to handle friendly messages without clashing with
  # stdout is to make a transactions handler.

  # maybe we need a Frontend class? like a TELLER
  # goal should be to display messages
  # maybe also to help DISPLAY the transaction history.

  # a TRANSACTION can be a class of its own.
  # it can be instantiated with each deps/withdr
  # it can be translated to a string
  # it should be a child class of Account

end


# ['date || credit || debit || balance ']
