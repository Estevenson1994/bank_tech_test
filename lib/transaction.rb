require 'date'

class Transaction

  attr_reader :type, :amount, :date

  def initialize(type, amount, date = Date.today)
    @type = type
    @amount = amount
    @date = date
  end

end
