require 'date'

class Statement

  attr_reader :transactions

  def initialize
    @transactions = []

  end

  def store_transaction(transaction)
    @transactions << transaction
  end

  def print_statement
    @statement = "date || credit || debit || balance"
    @transactions.reverse_each do |transaction| 
      add_date(transaction)
      add_transaction_amount(transaction)
      add_balance(transaction)
    end
    @statement
  end

  private

  def add_date(transaction)
    @statement += "\n" + formatted_date(transaction.date)
  end

  def add_transaction_amount(transaction)
    @statement += " || " + format_amount(transaction.deposit) + "|| " + format_amount(transaction.withdrawal)
  end

  def add_balance(transaction)
    @statement += "|| " + '%.2f' % transaction.balance
  end

  def format_amount(amount)
    (amount.is_a? Numeric) ? '%.2f' % amount + " " : amount
  end 

  def formatted_date(date)
    (date.is_a? String) ? Date.parse(date).strftime("%d/%m/%Y") : date.strftime("%d/%m/%Y")
  end
end
