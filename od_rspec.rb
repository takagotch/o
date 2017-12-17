class TEstMeme < Minitest::Test
include ApplicationService::MyCommandLint

def setup
	@command = Controller::MyCommand.new
end

end


