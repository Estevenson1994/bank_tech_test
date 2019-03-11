require 'statement'

RSpec.describe Statement do
  subject(:statement) { described_class.new }

  it 'balance is initially 0' do
    expect(statement.balance).to eq(0)
  end

  it 'user can make a deposit' do
    expect { statement.deposit(1000) }.to change { statement.balance }.by(1000)
  end

  it 'user can make a withdrawal' do
    expect { statement.withdraw(500) }.to change { statement.balance }.by(-500)
  end

  it 'deposits are stored in transactions' do
    statement.deposit(1000)
    expect(statement.transactions[0][:deposit]).to eq(1000)
    expect(statement.transactions[0][:balance]).to eq(1000)
  end

  it 'withdrawals are stored in transactions' do
    statement.withdraw(1000)
    expect(statement.transactions).to include({ withdraw: 1000, balance: -1000 })
  end

  it 'stores the date when a deposit is made' do
    statement.deposit(1000, "14-01-2012")
    expect(statement.transactions).to include({ date: "14/01/12", deposit: 1000, balance: 1000 })
  end

  
end
