require './lib/printer'
require './lib/account'

# A Clerk returns reports detailing the result of a task
class Clerk
  def initialize
    @account = Account.new
    @printer = Printer.new
  end

  def make_deposit(amount)
    @account.deposit(amount)
    "Deposit successful"
  end

  def make_withdrawal(amount)
    @account.withdraw(amount)
    "Withdrawal successful"
  end

  def get_balance
    "Your balance is: #{format('%.2f', @account.balance)}"
  end

  def get_statement
    @printer.print_statement(@account)
  end
end