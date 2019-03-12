require 'date'

class Transaction

  attr_reader :deposit, :withdrawal, :date, :balance

  def initialize(deposit, withdrawal, date = Date.today, balance)
    @deposit = deposit
    @withdrawal = withdrawal
    @date = date
    @balance = balance
  end

end
