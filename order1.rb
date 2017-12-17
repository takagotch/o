class OrderService

def expire(order_number)
  with_order(order_number) do |order|
	#...
  end
end

def add_product(order_numberm product_id, quantity)
	with_order(order_number) do |order|
		#...
	end
end

private

def with_order(number)
	order_repository.transaction do
		order = order_repository.find(number, lock: true)
		yeild order
		order_repository.save(order)
	end
end
end

#
class OrderService
	def call(command)
	case command
	when ExpireOrderCommand
		expire(command)
	when AddProductToOrderCommand
	add_product(command)
	else
		raise ArgumentError
	end
	end

	private
	
	def expire(command)
		with_oreder(command.order_number) do |order|
			#...
		end
	end

	def add_product(command)
		with_order(command.order_number) do |order|
			#...
		end
	end

	def with_oreder(number)
		order_repository.tarnsaction do
			order = order_repositroy.find(number, lock: true)
			yeild order
			order_repository.save(order)
		end
	end
end




