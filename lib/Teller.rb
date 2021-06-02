# require_relative './messages.rb'
require './lib/Account'

class Teller

  attr_accessor :customer

  def initialize(customer)
    @customer = Account.new(customer)
    @session_ended = false
  end

  def session
    p "Welcome, #{@customer.name}"
    while @session_ended == false
      present_options()
      implement_choice()
    end
    goodbye(@customer.name)
    exit
  end

  def present_options
    puts "enter 'deposit' to deposit, 'withdraw' to withdraw, 'balance' for balance, 'statement' for a statement, or 'quit' to leave"
  end

  def implement_choice()
    choice = gets.chomp
    if choice == 'deposit'
      @customer.make_deposit()
    elsif choice == 'withdraw'
      @customer.make_withdrawal()
    elsif choice == 'balance'
      p "your balance is #{@customer.balance}"
    elsif choice == 'statement'
      print_statement(@customer.transaction_history)
    elsif choice == 'quit'
      @session_ended = true
    else
      'invalid option'
    end
  end

  def print_statement(history)
    print "|     date     || credit || debit || balance |\n"
    history.reverse.each do |row|
      row.each do |item|
        print "|  #{item.to_s}  |"
      end
      print "\n"
    end
  end

  def goodbye(customer)
    puts "thanks, #{customer}, and have a great day!"
  end

end
