class Account

  attr_accessor:name, :balance, :transaction_history

  def initialize(name, balance = 0)
    @name = name
    @balance = balance
    @transaction_history = []
  end

  # INPUT function

  def make_deposit
    puts 'how much?'
    deposit = gets.chomp
    deposit = deposit.to_i
    @transaction_history.push([0,deposit,0, (@balance+deposit)])
    @balance += deposit
  end
end


# ['date || credit || debit || balance ']
