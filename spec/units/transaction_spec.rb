require 'transaction'

RSpec.describe Transaction do

    before(:each) do
        @transaction = Transaction.new("deposit")
    end


    it 'stores transaction type' do
        expect(@transaction.type).to eq("deposit") 
    end
end