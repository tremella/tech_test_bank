require_relative './messages.rb'
require './lib/Account'

class Teller

  attr_accessor :customer

  def initialize(customer)
    @customer = Account.new(customer)
  end

  def welcome
    puts present_options()
    pick = gets.chomp
    implement_choice(pick)
  end


  def implement_choice(choice)
    if choice == 'deposit'
      @customer.make_deposit()
    elsif choice == 'withdraw'
      @customer.make_withdrawal()
    elsif choice == 'balance'
      @customer.balance
    elsif choice == 'statement'
      print_statement(@customer.transaction_history)
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

end
