# frozen_string_literal: true

require './lib/account'
require './lib/clerk'

class Teller
  attr_accessor :customer

  def initialize(customer_name)
    @customer_name = customer_name
    @clerk = Clerk.new(customer_name)
  end

  def session
    say_hello
    listen
  end

  private 
  
  def listen
    while true
      present_options
      implement_choice
    end
  end

  def say_hello
    puts "Welcome, #{@customer_name}"
  end

  def say_goodbye
    puts "Thanks, #{@customer_name}, and have a great day!"
  end

  def present_options
    puts "enter 'deposit', 'withdraw', 'balance', 'statement', or 'quit'"
  end

  def implement_choice
    choice = gets.chomp

    if choice == 'quit'
      say_goodbye
      exit
    else
      puts @clerk.run_task(choice)
    end
  end
end
