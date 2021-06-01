
This is a command-line tool to simulate the user experience of a few basic banking transactions.
Users should be able to:

- deposit and withdraw funds,
- see their current balance, and
- obtain a statement of their transaction history.

Full requirements and acceptance criteria can be found at https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md .

| Account class |                                         |
|---------------|-----------------------------------------|
| Attributes    | transaction_history, name, balance |
| Methods       | make_deposit, make_withdrawal  |

New classes to ensure SRP

| Teller class |                                         |
|---------------|-----------------------------------------|
| Attributes    |  ? |
| Methods       | show_options, show_statement, show_balance |

| Transaction class |                                     |
|---------------|-----------------------------------------|
| Attributes    | date, credit, debit, balance, parsed_self|
