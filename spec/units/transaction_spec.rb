require 'transaction'

RSpec.describe Transaction do

  before(:each) do
    @transaction = Transaction.new(1000, "", "12/01/2010", 1000)
  end

  it 'stores transaction deposit amount' do
    expect(@transaction.deposit).to eq(1000) 
  end

  it 'stores amount' do
    expect(@transaction.withdrawal).to eq("")
  end

  it 'stores the date' do
    expect(@transaction.date).to eq("12/01/2010")
  end

  it 'stores current balance' do
    expect(@transaction.balance).to eq(1000)
  end
end
