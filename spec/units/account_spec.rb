require 'account'

RSpec.describe Account do
  before(:each) do
    statement = instance_double('statement', :transactions => [])

    @account = Account.new(statement)
  end

  it 'balance is initially 0' do
    expect(@account.balance).to eq(0)
  end

  it 'user can make a deposit' do
    expect { @account.deposit(1000) }.to change { @account.balance }.by(1000)
  end

  it 'user can make a withdrawal' do
    expect { @account.withdraw(500) }.to change { @account.balance }.by(-500)
  end

end
