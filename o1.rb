class OrderService
  def call
  when ExpireOrderCommand
	  expire(command)
  when AddProductToOrderCommand
	  add_product(command)
  end
  raise ArgumentError
  end
end

private

def expire(command)
	with_order(command.order_number) do |order|
		#...
	end
end

def add_product(command)
	with_order(command.order_number) do |order|
		#...
end

