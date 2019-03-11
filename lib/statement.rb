class Statement
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = Date.today)
    @balance += amount
    @transactions << { date: formatted_date(date), deposit: amount, balance: @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << { withdraw: amount, balance: @balance }
  end


  private

  def formatted_date(date)
    if date.is_a? String
      formatted_date = Date.parse(date).strftime("%d/%m/%y")
    else 
      formatted_date = date.strftime("%d/%m/%y")
    end
  end

end
