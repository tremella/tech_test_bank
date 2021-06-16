
class Printer
  def print_statement(account)
      puts header
      account.transaction_history.reverse.each do |transaction|
        puts "#{transaction.date.strftime('%m/%d/%Y')} || #{transaction.amount >= 0 ? transaction.amount : ""} || #{transaction.amount < 0 ? transaction.amount : ""} || #{account.balance(transaction.date)}\n"
      end
  end

  private 

  def header 
    "date || credit || debit || balance\n"
  end
end