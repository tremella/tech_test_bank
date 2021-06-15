# frozen_string_literal: true

# require_relative './messages.rb'

require './lib/account'
require './lib/clerk'

# A Teller is only needed when we have a customer, 
# therefore a teller *should* hold customer, but not as an account

class Teller
  attr_accessor :customer

  def initialize(customer)
    @customer = customer
    @clerk = Clerk.new(customer)
    @session_ended = false
  end

  def session
    puts "Welcome, #{@customer.name}"

    while @session_ended == false
      present_options
      implement_choice
    end

    goodbye(@customer.name)

    exit
  end

  def present_options
    puts "enter 'deposit', 'withdraw', 'balance', 'statement', or 'quit'"
  end

  def implement_choice
    choice = gets.chomp
    @clerk.run_task(choice)
  end

  def show_balance
    puts "your balance is #{format('%.2f', @customer.balance)}"
  end

  def goodbye(customer)
    puts "thanks, #{customer}, and have a great day!"
  end
end
