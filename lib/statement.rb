require 'date'

class Statement

  attr_reader :transactions

  def initialize()
    @transactions = []
  end

  private

  def formatted_date(date)
    if date.is_a? String
      Date.parse(date).strftime("%d/%m/%y")
    else 
      date.strftime("%d/%m/%y")
    end
  end
end
