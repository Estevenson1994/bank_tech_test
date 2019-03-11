require 'statement'

RSpec.describe Statement do
    before(:each) do
      account = double('account')
      allow(account).to receive(:balance)
      allow(account).to receive(:deposit)

      @statement = Statement.new(account)
    end

    it 'initially has no transactions' do
        expect(@statement.transactions.length).to eq(0)
    end

    it 'can store a deposit' do
        expect { @statement.deposit(1000) }.to change { @statement.transactions.length }.by(1)
        expect(@statement.transactions[0][:deposit]).to eq(1000)
    end
end