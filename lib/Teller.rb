# frozen_string_literal: true

require './lib/account'
require './lib/clerk'


# A Teller takes I/O from the customer and delegates tasks to the Clerk
class Teller
  TELLER_OPTIONS = ['deposit', 'withdraw', 'balance', 'statement']
  QUIT_COMMAND = 'quit'

  def initialize(customer_name)
    @customer_name = customer_name
    @clerk = Clerk.new
  end

  def session
    puts say_hello

    while true
      ask_what_to_do
    end
  end

  private 

  def implement_choice(choice)
    if choice == 'quit'
      say_goodbye
      exit
    elsif choice == 'deposit'
      @clerk.make_deposit(ask_how_much)
    elsif choice == 'withdraw'
      @clerk.make_withdrawal(ask_how_much)
    elsif choice == 'balance'
      @clerk.get_balance
    elsif choice == 'statement'
      @clerk.get_statement
    else
      "Sorry I don't know how to do that!"
    end
  end

  def ask_what_to_do
    puts present_options
    puts implement_choice(gets.chomp)
  end

  def ask_how_much
    puts 'How much?'
    gets.chomp.to_f
  end

  def present_options
    "Please type #{TELLER_OPTIONS.map{ |e| "'#{e}'" }.join(", ")} or '#{QUIT_COMMAND}' followed by the enter key"
  end

  def say_hello
    "Welcome, #{@customer_name}"
  end

  def say_goodbye
    "Thanks, #{@customer_name}, and have a great day!"
  end
end
