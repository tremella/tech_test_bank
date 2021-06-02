require_relative './messages.rb'
require './lib/Account'

class Teller

  attr_accessor :customer

  def initialize(customer)
    @customer = Account.new(customer)
  end

  def welcome
    present_options()
    @customer.make_deposit()


  end
end
