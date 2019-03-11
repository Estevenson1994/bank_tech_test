require 'statement'

RSpec.describe Statement do
    before(:each) do
      @transaction1 = instance_double("transaction1", :type => :deposit, :amount => 1000, :date => "12/01/2010", :balance => 1000)
      @transaction2 = instance_double("transaction2", :type => :withdrawal, :amount => 300, :date => "13/01/2010", :balance => 700)
      @statement = Statement.new
    end

  it 'initially has no transactions' do
    expect(@statement.transactions.length).to eq(0)
  end

  it 'can store transactions' do
    expect{ @statement.store_transaction(@transaction1) }.to change{ @statement.transactions.length}.by(1)
  end
    
end
