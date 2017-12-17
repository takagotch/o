class SetDeliveryMethodAndConfirmCommand
	attr_accessor :order_number,
		      :delivery_method
end

class OrderService
def call(command)
case command
when SetDeliveryMethodAndConfirmCommand
	delicery_and_confirm(command)
when ConfirmCommand
	confirm(command)
when SetDeliveryMethodCommand
	set_delivery(command)
	#...
else
	raise ArgumentError
end
end

private

def delivery_and_confirm(command)
	with_order(command.order_number) do |order|
		order.set_delivery_method(command.delivery_method)
		order.confirm
	end
end
#...

end


