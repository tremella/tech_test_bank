require 'date'

class Transaction 
  attr_reader :amount, :date

  def initialize(amount, date = Time.now)
    @amount = amount
    @date = date
  end
end