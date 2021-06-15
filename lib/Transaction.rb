require 'date'

class Transaction 
  attr_reader :amount, :balance, :date

  def initialize(amount, balance, date = Date.new)
    @amount = amount
    @balance = balance
    @date = date
  end
end