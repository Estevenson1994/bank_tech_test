class Statement
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { deposit: amount, balance: @balance }
  end

  def withdraw(amount)
    @balance -= amount
  end
end
