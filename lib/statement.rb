require 'date'

class Statement

  attr_reader :transactions

  def initialize()
    @transactions = []
  end

  def store_transaction(transaction)
    @transactions << transaction
  end

  def print_statement
    statement = "date || credit || debit || balance"
    @transactions.reverse_each do |transaction| 
      statement += "\n" + formatted_date(transaction.date)
      if transaction.type == :deposit
        statement += " || " + '%.2f' % transaction.amount + " ||"
      else
        statement += " || || " + '%.2f' % transaction.amount
      end
      statement += " || " + '%.2f' % transaction.balance
    end
    statement
  end

  private

  def formatted_date(date)
    if date.is_a? String
      Date.parse(date).strftime("%d/%m/%Y")
    else 
      date.strftime("%d/%m/%Y")
    end
  end
end
