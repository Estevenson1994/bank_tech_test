
class Statement
    attr_reader :transactions

  def initialize(account)
    @transactions = []
    @account = account
  end

  def deposit(amount, date = Date.today)
    @account.deposit(amount, date)
    @transactions << { date: date, deposit: amount, balance: @account.balance }
  end

end