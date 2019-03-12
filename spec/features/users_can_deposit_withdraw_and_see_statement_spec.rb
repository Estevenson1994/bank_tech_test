require 'date'
require 'statement'
require 'transaction'
require 'account'

RSpec.describe Account do
  subject(:account) { described_class.new }

  it 'users can deposit, withdraw and see their statement' do
    account.deposit(1000, '10-01-2012')
    account.deposit(2000, '13-01-2012')
    account.withdraw(500, '14-01-2012')
    expect(account.statement.print_statement).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end
end
