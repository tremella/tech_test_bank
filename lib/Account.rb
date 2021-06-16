# frozen_string_literal: true
require 'date'
require './lib/transaction'

# An Account holds a history of transactions
class Account
  attr_reader :transaction_history

  def initialize
    @transaction_history = []
  end

  def deposit(amount)
    @transaction_history << Transaction.new(amount)
  end

  def withdraw(amount)
    @transaction_history << Transaction.new(-amount)
  end

  def balance(untilDate = Time.now)
    relevant_transactions = @transaction_history.filter { |transaction | transaction.date <= untilDate }
    relevant_transactions.inject(0) { |sum, transaction| sum + transaction.amount } 
  end
end
