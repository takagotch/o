class Controller < ApplicationContorller
class MyCommand
	def initialize(session, params)
		@sessoin = session
		@params = params
	end

	def user_id
		session.fetch(:user_id)
	end

	def product_id
		params.fetch(:product).fetch(:id)
	end

	def command_name
		"MyCommand"
	end

	def create
		cmd = MyCommand.new(session, params)
		ApplicationService.new.call(cmd)
		head :ok
	end
	
end

#
class Controller < ApplicationController

def create
	cmd = MyCommand.new
	cmd.user_id = session.fetch(:user_id)
	cmd.product_id =
params.fetch(:product).fetch(:id)
	ApplicationService.new.call(cmd)
	head :ok
end
end

end

##
class Controller < ApplicationController
def create
	cmd = MyCommand.new(
		user_id: session.fetch(:user_id)
		product_id: params.fetch(:product).fetch(:id)
	)
	ApplicationService.new.call(cmd)
	head :ok
end
end

end

