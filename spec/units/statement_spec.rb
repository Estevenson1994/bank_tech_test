require 'statement'

RSpec.describe Statement do
    subject(:statement) { described_class.new }

    it 'balance is initially 0' do
        expect(statement.balance).to eq(0)
    end

end
