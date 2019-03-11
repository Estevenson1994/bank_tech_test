require 'statement'

RSpec.describe Statement do
    before(:each) do
      @transaction1 = instance_double("transaction1", :type => :deposit, :amount => 1000.00, :date => "12/01/2010", :balance => 1000)
      @transaction2 = instance_double("transaction2", :type => :withdrawal, :amount => 300.00, :date => "13/01/2010", :balance => 700)
      @statement = Statement.new
    end

  it 'initially has no transactions' do
    expect(@statement.transactions.length).to eq(0)
  end

  it 'can store transactions' do
    expect{ @statement.store_transaction(@transaction1) }.to change{ @statement.transactions.length}.by(1)
  end

  it 'can print statement' do
    @statement.store_transaction(@transaction1)
    expect(@statement.print_statement).to eq("date || credit || debit || balance\n12/01/2010 || 1000.00 || || 1000.00")
  end

  it 'can two print statement' do
    @statement.store_transaction(@transaction1)
    @statement.store_transaction(@transaction2)
    expect(@statement.print_statement).to eq("date || credit || debit || balance\n12/01/2010 || 1000.00 || || 1000.00\n13/01/2010 || || 300.00 || 700.00")
  end
end
