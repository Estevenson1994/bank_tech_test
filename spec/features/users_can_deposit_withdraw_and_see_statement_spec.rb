require 'statement'

RSpec.describe Statement do
    subject(:statement) { described_class.new }

    it 'users can deposit, withdraw and see their statement' do
        statement.deposit(1000, "10-01-2012")
        statement.deposit(2000, "13-01-2012")
        statement.withdraw(500, "14-01-2012")
        expect(statement.show_statement).to eq("date || credit || debit || balance\n14/-1/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
    end 
end