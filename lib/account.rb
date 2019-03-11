class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = Date.today)
    @balance += amount
    @transactions << { date: formatted_date(date), deposit: amount, balance: @balance }
  end

  def withdraw(amount, date = Date.today)
    @balance -= amount
    @transactions << { date: formatted_date(date), withdraw: amount, balance: @balance }
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
