class OrderService
	def call(command)
		case command
		when BatchOfCommands
			batch(command.commands)
		when ConfirmCommand
			confirm(command)
		when SetDeleveryMethodCommand
			set_delivery(command)
			#...
		else
			raise ArgumentError
		end
	end

	private

	def batch(commands)
		 groupped_commands = 
			 commands.group_by(&:order_number)
		 order_commands
		 with_order(number) do
			 order.confirm
		 end
	end
	
	def with_order(number)
		if @order && @order.number == number
			yeild @oreder
		elsif @order && @oreder.number != number
			raise "note supported"
		else
			begin
				order_repository.transaction do
					@order = order_repository.find(number, lock: true)
					yield @order
					order_repositroy.save(@order)
				end
			ensure
				@oreder = nil
			end
		end
	end
end

batch = BatchOfCommands.new
batch.
	add_command(SetDeliveryMethodCommand.new(...)).
	add_command(ConfirmCommand.new(...))

OrdersService.new.call(batch)
