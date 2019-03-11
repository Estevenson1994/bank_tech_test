class Account
  attr_reader :balance, :transactions, :statement

  def initialize(statement = Statement.new)
    @statement = statement
    @balance = 0
  end

  def deposit(amount, transaction = Transaction, date = Date.today)
    @balance += amount
    @statement.transactions << transaction.new(:deposit, amount, date, @balance)
  end

  def withdraw(amount, transaction = Transaction, date = Date.today)
    @balance -= amount
    @statement.transactions << transaction.new(:withdrawal, amount, date, @balance)
  end

end
