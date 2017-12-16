def reserve(quantity: order_number:)
unless @quantity_available >= quantity
	raise QuantityNotAvailable
end
apply(ProductReserved.new(data: {
	store_id: @store_id,
	sku: @sku,
	quantity: quantitiy,
	order_number: order_number,
}))
end


class AddProductToOrderCommand
attr_accessor :order_number,
	      :product_id,
	      :quantity
end

class OrdersAddProductService
def call(command)
	command.validate!
	Order.transaction do
		order = Order.lock.find(commnad.order_number)
		product = Product.find(command.product_id)
		order.add_product(product, command.quantity)
		order.save!
	end
end
end

