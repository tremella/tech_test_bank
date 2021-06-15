require './lib/printer'
require './lib/account'

class Clerk
  def initialize(customer_name)
    @account = Account.new(customer_name)
    @printer = Printer.new
  end

  def run_task(choice, account)
    if choice == 'deposit'
      @account.make_deposit
    elsif choice == 'withdraw'
      @account.make_withdrawal
    elsif choice == 'balance'
      @account.get_balance
    elsif choice == 'statement'
      @printer.print_statement( @account)
    else
      'invalid option'
    end
  end

  def get_balance
    "#{format('%.2f', @customer.balance)}"
  end
end