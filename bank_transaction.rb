class CreditCard
	attr_accessor :acc_balance

	def initialize(acc_balance)
		@acc_balance = acc_balance
	end
end

class BankCustomer
	def initialize(credit_card)
		@credit_card = credit_card
	end

	def get_credit_card
		@credit_card
	end
end

class Bank
	def withdraw(credit_card, amount)
		if credit_card.acc_balance >=amount
			credit_card.acc_balance = credit_card.acc_balance - amount
			true
		else
			false
		end
	end
end

class Store
	def initialize(bank)
		@bank=bank
	end

	def sell_coffee(customer)
		if @bank.withdraw(customer.get_credit_card(), 5)
			puts "Transaction allowed."
		else
			puts "Transaction denied."
		end
	end
end

#create CreditCard object
cc=CreditCard.new(10)

#create BankCustomer object
bc=BankCustomer.new(cc)

#create Bank object
b=Bank.new()

#create Store object
s=Store.new(b)

#make store sell $5 coffee to our customer first time; Credit Card balance before transaction = $10
puts s.sell_coffee(bc)
#Result: Transaction allowed.

#make store sell $5 coffee to our customer second time; Credit Card balance before transaction = $5
puts s.sell_coffee(bc)
#Result: Transaction allowed.

#make store sell $5 coffee to our customer third time; Credit Card balance before transaction = $0
puts s.sell_coffee(bc)
#Result: Transaction denied.