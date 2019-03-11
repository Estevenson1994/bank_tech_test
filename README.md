## Bank Tech Test

This is a practise test from week10 of [Makers Academy](https://makers.tech/).
The specification for this test is as follows:

Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.

Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
Acceptance criteria
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

# Class Diagrams

![Screenshot](https://i.imgur.com/UbPV52v.png)
