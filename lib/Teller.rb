require_relative './messages.rb'
require './lib/Account'

class Teller

  attr_accessor :customer

  def initialize(customer)
    @customer = Account.new(customer)
  end

  def welcome
    puts present_options()



  end
end
