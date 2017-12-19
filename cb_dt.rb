class Controller
	def update
		@cart = Cart.find(params[:id])
		@cart.update_attribute!(...)
		@cart.update_tax
		head :ok
	end
end


class Order
	before_save :set_amount

	def add_line(...)
	end

	private

	def set_amount
		self.amount = line_items.map(&:amount).sum
	end
end

