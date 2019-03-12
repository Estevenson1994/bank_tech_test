require 'date'

class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
    @statement = "date || credit || debit || balance"

  end

  def store_transaction(transaction)
    @transactions << transaction
  end

  def print_statement
    @transactions.reverse_each do |transaction| 
      @statement += "\n" + formatted_date(transaction.date)
      add_transaction_amount(transaction)
      @statement += " || " + '%.2f' % transaction.balance
    end
    @statement
  end

  private

  def add_transaction_amount(transaction)
    if transaction.type == :deposit
      @statement += " || " + '%.2f' % transaction.amount + " ||"
    else
      @statement += " || || " + '%.2f' % transaction.amount
    end
  end

  def formatted_date(date)
    (date.is_a? String) ? Date.parse(date).strftime("%d/%m/%Y") : date.strftime("%d/%m/%Y")
  end
end
