require 'account'

RSpec.describe Account do
  subject(:account) { described_class.new }

  it 'balance is initially 0' do
    expect(account.balance).to eq(0)
  end

  it 'user can make a deposit' do
    expect { account.deposit(1000) }.to change { account.balance }.by(1000)
  end

  it 'user can make a withdrawal' do
    expect { account.withdraw(500) }.to change { account.balance }.by(-500)
  end

  it 'deposits are stored in transactions' do
    account.deposit(1000)
    expect(account.transactions[0][:deposit]).to eq(1000)
    expect(account.transactions[0][:balance]).to eq(1000)
  end

  it 'withdrawals are stored in transactions' do
    account.withdraw(1000)
    expect(account.transactions[0][:withdraw]).to eq(1000)
    expect(account.transactions[0][:balance]).to eq(-1000)
  end

  it 'stores the date when a deposit is made' do
    account.deposit(1000, "14-01-2012")
    expect(account.transactions).to include({ date: "14/01/12", deposit: 1000, balance: 1000 })
  end

  it 'stores the date when a withdrawal is made' do
    account.withdraw(1000, "13-01-2012")
    expect(account.transactions).to include({ date: "13/01/12", withdraw: 1000, balance: -1000 })
  end
  
end
