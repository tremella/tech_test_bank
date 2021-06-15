
class Printer
  def print_statement(account)
    if account.transaction_history == []
      puts 'no transactions to show'
    else
      print "|     date     || credit || debit || balance |\n"
      account.transaction_history.reverse.each do |row|
        row.each do |item|
          print "|  #{item}  |"
        end
        print "\n"
      end
    end
  end
end