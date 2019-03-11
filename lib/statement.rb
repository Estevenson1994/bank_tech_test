require 'date'

class Statement

  attr_reader :transactions

  def initialize(account)
    @transactions = []
    @account = account
  end

  def deposit(amount, date = Date.today)
    @account.deposit(amount)
    @transactions << { date: formatted_date(date), deposit: amount, balance: @account.balance }
  end

  def withdraw(amount, date = Date.today)
    @account.withdraw(amount)
    @transactions << { date: formatted_date(date), withdraw: amount, balance: @account.balance }
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
