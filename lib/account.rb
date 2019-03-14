class Account
  attr_reader :balance, :transactions, :statement

  def initialize(statement = Statement.new)
    @statement = statement
    @balance = 0
  end

  def deposit(amount, date = Date.today, transaction = Transaction)
    @balance += amount
    @statement.store_transaction(transaction.new(amount, "", date, @balance))

  end

  def withdraw(amount, date = Date.today, transaction = Transaction)
    raise 'Insufficent funds' if balance_too_low(amount)
    @balance -= amount
    @statement.store_transaction(transaction.new("", amount, date, @balance))
  end

  private

  def balance_too_low(amount)
    @balance - amount < 0
  end

end
