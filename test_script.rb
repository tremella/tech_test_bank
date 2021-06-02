require_relative './lib/Teller.rb'

p 'hello world'

t = Teller.new('Jan')
t.customer.make_deposit()
t.customer.make_deposit()
t.customer.make_withdrawal()
t.welcome()
