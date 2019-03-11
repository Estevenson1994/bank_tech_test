require 'date'

class Transaction

  attr_reader :type, :amount, :date, :balance

  def initialize(type, amount, date = Date.today, balance)
    @type = type
    @amount = amount
    @date = date
    @balance = balance
  end

end
