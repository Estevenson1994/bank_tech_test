require 'transaction'

RSpec.describe Transaction do

  before(:each) do
    @transaction = Transaction.new("deposit", 1000, "12/01/2010")
  end

  it 'stores transaction type' do
    expect(@transaction.type).to eq("deposit") 
  end

  it 'stores amount' do
    expect(@transaction.amount).to eq(1000)
  end

  it 'stores the date' do
    expect(@transaction.date).to eq("12/01/2010")
  end
end
