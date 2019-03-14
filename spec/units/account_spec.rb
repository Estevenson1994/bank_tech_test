require 'account'

RSpec.describe Account do
  before(:each) do
    statement = instance_double('statement', :transactions => [])
    allow(statement).to receive(:store_transaction)
    @account = Account.new(statement)
    @account.deposit(1000)
  end

  it 'user can make a deposit' do
    expect { @account.deposit(1000) }.to change { @account.balance }.by(1000)
  end

  it 'user can make a withdrawal' do
    expect { @account.withdraw(500) }.to change { @account.balance }.by(-500)
  end

  it 'raises an error if insufficient funds' do
    expect { @account.withdraw(1200) }.to raise_error 'Insufficent funds'
  end

end
