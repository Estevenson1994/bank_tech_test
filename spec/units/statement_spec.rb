require 'statement'

RSpec.describe Statement do
  subject(:statement) { described_class.new}

  it 'initially has no transactions' do
    expect(statement.transactions.length).to eq(0)
  end

end
