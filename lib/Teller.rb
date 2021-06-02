# require_relative './messages.rb'
require './lib/Account'

class Teller

  attr_accessor :customer

  def initialize(customer)
    @customer = Account.new(customer)
    @session_ended = false
  end

  def session
    puts "Welcome, #{@customer.name}"
    while @session_ended == false
      present_options()
      implement_choice()
    end
    goodbye(@customer.name)
    exit
  end

  def present_options
    puts "enter 'deposit', 'withdraw', 'balance', 'statement', or 'quit'"
  end

  def implement_choice()
    choice = gets.chomp
    if choice == 'deposit'
      @customer.make_deposit()
    elsif choice == 'withdraw'
      @customer.make_withdrawal()
    elsif choice == 'balance'
      show_balance()
    elsif choice == 'statement'
      print_statement(@customer.transaction_history)
    elsif choice == 'quit'
      @session_ended = true
    else
      'invalid option'
    end
  end

  def print_statement(history)
    if @customer.transaction_history == []
      puts "no transactions to show"
    else
      print "|     date     || credit || debit || balance |\n"
      history.reverse.each do |row|
        row.each do |item|
          print "|  #{item.to_s}  |"
        end
        print "\n"
      end
    end
  end

  def show_balance
    puts "your balance is #{sprintf('%.2f', @customer.balance)}"
  end

  def goodbye(customer)
    puts "thanks, #{customer}, and have a great day!"
  end

end
