# frozen_string_literal: true
require 'date'
require './lib/transaction'

# An Account holds a history of transactions and allows you to retrieve a balance
class Account
  attr_reader :transaction_history

  def initialize
    @transaction_history = []
  end

  def deposit(amount)
    @transaction_history << Transaction.new(amount, balance)
  end

  def withdraw(amount)
    @transaction_history << Transaction.new(-amount, balance)
  end

  def balance
    @transaction_history.inject(0) { |sum, transaction| sum + transaction.amount } 
  end
end
