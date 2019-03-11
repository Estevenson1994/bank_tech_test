require 'statement'

RSpec.describe Statement do
    before(:each) do
      account = double('account')
      allow(account).to receive(:balance)
      allow(account).to receive(:deposit)
      allow(account).to receive(:withdraw)

      @statement = Statement.new(account)
    end

    it 'initially has no transactions' do
        expect(@statement.transactions.length).to eq(0)
    end

    it 'can store a deposit' do
        expect { @statement.deposit(1000) }.to change { @statement.transactions.length }.by(1)
        expect(@statement.transactions[0][:deposit]).to eq(1000)
    end

    it 'can store a withdrawal' do
        expect { @statement.withdraw(1000) }.to change { @statement.transactions.length }.by(1)
        expect(@statement.transactions[0][:withdraw]).to eq(1000)
    end

    it 'stores date when a deposit is made' do
        @statement.deposit(1000, "14-01-2012")
        expect(@statement.transactions[0][:date]).to eq("14/01/12")
        expect(@statement.transactions[0][:deposit]).to eq(1000)
    end

    it 'stores date when a withrawal is made' do
        @statement.withdraw(1000, "13-01-2012")
        expect(@statement.transactions[0][:date]).to eq("13/01/12")
        expect(@statement.transactions[0][:withdraw]).to eq(1000)
    end
end