class BatchOfCommands
	attr_reader :commands

	def initialize
		@commands = []
	end

	def add_command(cmd)
	commands << cmd
	self
	end
end

class OrderService
	def call(command)
	case command
	when BatchOfCommands
		batch(command.commands)
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

	def batch(commands)
		commands.each{ |cmd| call(cmd) }
	end

	#...
end

batch = BatchOfCommands.new
batch.
	add_command(SetDeliveryMethodCommand.new(...)).
	add_command(ConfirmCommnad.new(...))

OrderService.new.call(batch)

