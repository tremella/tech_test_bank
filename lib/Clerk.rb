class Clerk
  def intialize(customer)
    @account = Account.new(customer)
  end

  def run_task(choice, account)
    if choice == 'deposit'
      @account.make_deposit
    elsif choice == 'withdraw'
      @account.make_withdrawal
    elsif choice == 'balance'
      "#{format('%.2f', @customer.balance)}"
    elsif choice == 'statement'
      print_statement(@customer.transaction_history)
    elsif choice == 'quit'
      @session_ended = true
    else
      'invalid option'
    end
  end

  def get_balance
    "#{format('%.2f', @customer.balance)}"
  end
end