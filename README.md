###PURPOSE###

This is a command-line tool to simulate the user experience of a few basic banking transactions.

Users should be able to:

- deposit and withdraw funds,
- see their current balance, and
- obtain a statement of their transaction history.
- interact with a virtual teller (my addition)

Full requirements and acceptance criteria can be found at https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md

###TO RUN###

To test this out:
- clone the repo
```sh
bundle install
```
```sh
ruby demo_script.rb
```
The above script runs a session for a client named Jan with an empty account.

###CLASSES###

To keep SRP, I created an account class to handle any transactions which would alter the account, and a teller class for "displaying" transactions and providing an interface for the user.

| Account class |                                         |
|---------------|-----------------------------------------|
| Attributes    | transaction_history, name, balance |
| Methods       | make_deposit, make_withdrawal  |


| Teller class  |                                         |
|---------------|-----------------------------------------|
| Attributes    |  customer |
| Methods       | session, present_options, implement_choice,  print_statement, show_balance, goodbye|

###TO DO###

TDD went well for the Account class but I'm struggling to test the user inputs for the teller class (especially with gets.chomp). Pointers and examples sorely needed, thanks in advance.
