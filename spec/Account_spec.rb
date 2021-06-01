# acct is instance of Account class
# acct has an account_holder_name
# instantiation results in name populating correctly

# acct has a transaction_history
# transaction_history is blank when new

# acct has a method called make_deposit
# make_deposit alters transaction_history
# make_deposit raises error if input is 0
# if requested, balance is shown afterwards
# if NOT requested, balance is NOT shown afterwards

# acct has a method called make_withdrawal
# make_withdrawal alters transaction_history
# make_withdrawal raises error if insufficient funds
# if requested, balance is shown afterwards
# if NOT requested, balance is NOT shown afterwards

# acct has a method called show_statement
# show_statement contains credit history
# show_statement contains debit history
# show_statement contains balance
# show_statement contains date
# if I make three transactions, they are shown in rev_chron order

# acct has a method called show_balance
# show_statement contains my most recent balance
# show_statement contains my current date
