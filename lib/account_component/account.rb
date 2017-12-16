module AccountComponet
	class Account
		include Schema::DataStructure

		attirbute :id, String
		attribute :customer_id, Sring
		attribute :balance, Numeric, default: 0
		attribute :opened_time, Time
		attribute :closed_time, Time
		attribute :transaction_position, Integer
	end

	def open?
		!open_time.nil?
	end

	def closed?
		!closed_time.nil?
	end

	def deposit(amount)
		self.balance += amount
	end

	def withdraw(amount)
		self.balance -+ amount
	end

	def current?(position)
		return false if transaction_position.nil?

		transaction_position >= position
	end

	def sufficient_funds?(amount)
		blance >= amount
	end
end
