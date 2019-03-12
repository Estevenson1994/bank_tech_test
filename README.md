## Bank Tech Test

This is a practise test from week10 of [Makers Academy](https://makers.tech/).
The specification for this test is as follows:

Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)

Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

Acceptance criteria:
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

# User Stories

```
As a user,
So I can add money to my account,
I would like to make a deposit and my balance is updated.

As a user,
So I can spend money,
I would like to be able to withraw from my account and my balance to be updated.

As a user,
So I can keep track of my spending,
I would like to be able to see a statement of all interactions I have made.
```

# How to run the program

- clone this repository
- run `bundle install` to install dependancies
- run `rspec` to run the tests
- see below for example of running the program in IRB

# Example of running the program:

```
2.5.1 :001 > require './lib/account.rb'
 => true 
2.5.1 :002 > require './lib/statement.rb'
 => true 
2.5.1 :003 > require './lib/transaction.rb'
 => true 

2.5.1 :004 > account = Account.new
 => #<Account:0x00007fe10514e338 @statement=#<Statement:0x00007fe10514e310 @transactions=[]>, @balance=0> 

2.5.1 :005 > account.deposit(1000)
 => [#<Transaction:0x00007fe105134730 @deposit=1000, @withdrawal="", @date=#<Date: 2019-03-12 ((2458555j,0s,0n),+0s,2299161j)>, @balance=1000>] 

2.5.1 :006 > account.deposit(2000)
 => [#<Transaction:0x00007fe105134730 @deposit=1000, @withdrawal="", @date=#<Date: 2019-03-12 ((2458555j,0s,0n),+0s,2299161j)>, @balance=1000>, #<Transaction:0x00007fe1051268d8 @deposit=2000, @withdrawal="", @date=#<Date: 2019-03-12 ((2458555j,0s,0n),+0s,2299161j)>, @balance=3000>] 

2.5.1 :007 > account.withdraw(2000)
 => [#<Transaction:0x00007fe105134730 @deposit=1000, @withdrawal="", @date=#<Date: 2019-03-12 ((2458555j,0s,0n),+0s,2299161j)>, @balance=1000>, #<Transaction:0x00007fe1051268d8 @deposit=2000, @withdrawal="", @date=#<Date: 2019-03-12 ((2458555j,0s,0n),+0s,2299161j)>, @balance=3000>, #<Transaction:0x00007fe104889fe0 @deposit="", @withdrawal=2000, @date=#<Date: 2019-03-12 ((2458555j,0s,0n),+0s,2299161j)>, @balance=1000>] 

2.5.1 :008 > account.statement.print_statement
 => "date || credit || debit || balance\n12/03/2019 || || 2000.00 || 1000.00\n12/03/2019 || 2000.00 || || 3000.00\n12/03/2019 || 1000.00 || || 1000.00" 
```

# Class Diagrams

![Screenshot](https://i.imgur.com/SLVqcLo.png))

# Approach

My approach for this tech test was first plan out which classes/methods I might need and then write a feature test for how I think the program should work.

I then used single unit tests to beginning implementing features. 

My arrangement of the program did change a few times through the program as I worked through the solution, I began to see better ways to do things which I didn't foresee before.

Finally I had to change the feature tests to fit my new implementation. 

I have 100% coverage for this implementation.

# Explanation of code struction:

I have attempt to keep my code as DRY as possible and to use SRP.
In my program I have three classes:
1. Transaction:
- This class is simply there to make a transaction object. This stores the value of the transaction, the overal balance after that transaction is made and the date on which the transaction was made.
2. Account:
- This class is responsible for storing the overall balance and has methods withdraw/deposit which changes the balance, and creates a transaction to be stored on the statement. 
3. Statement:
- This class is responsible for storing the transactions and printing a statement.

# Assumptions

During this implementations, I have assumed that transactions will be stored in chronological order and when a transaction is made, the current date is taken. 

Therefore, the transactions are listed in reverse order rather than based upon the actual date.

