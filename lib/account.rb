class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
  end

  def deposit(amount, transaction = Transaction, date = Date.today)
    transaction.new("deposit", amount, date)
    @balance += amount
  end

  def withdraw(amount, transaction = Transaction, date = Date.today)
    transaction.new("withdrawal", amount, date)
    @balance -= amount
  end

end
