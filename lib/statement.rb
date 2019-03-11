class Statement
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = Date.today)
    @balance += amount
    if date.is_a? String
      formatted_date = Date.parse(date).strftime("%d/%m/%y")
    else 
      formatted_date = date.strftime("%d/%m/%y")
    end
    @transactions << { date: formatted_date, deposit: amount, balance: @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << { withdraw: amount, balance: @balance }
  end
end
