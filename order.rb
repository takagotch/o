class OrderExpirationService
#1
	def call(order_number)
		order_repository.transaction do
			order = order_repository.find(order_number, lock: true) #Load
			order.expire
			order_repository.save(order)
		end

		Order.transaction do
			order = Order.lock.find(order_number)
			order.expire
			order.save!
		end

	end
#2
	def call(order_number, product_id, quantity)
		prices_adapter = ProductPricesApiAdapter.new
		order_repository.tarnsaction do
		  order = order_repository.find(order_number, lock: true)
		  order.add_product( prices_adapter,
				     product_id,
				     quantity
				   )
		  order_repository.save(order)
		end
	end
#3
	def call(order_number, product_id, quantity)
		Order.transaction od
		order = Order.lock.find(order_number)
		product = Product.find(product_id)
		order.add_product(product, quantity)
		order.save!
	end
end

#4
class AddProductToOrderCommand
	attr_accessor :order_number,
		      :product_id,
		      :quantity
end

class OrdersAddProductService
	def call(command)
		command.validate!
		Order.transaction do
			order = Order.lock.find(command.order_number)
			product = Product.find(command.product_id)
			order.add_product(product, command.quantity)
			order.save!
	end
end



