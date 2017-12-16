module IdentityAndAccess
	class RegisterSeasonPassHolder < ApplicationJob
		queue_as :default

	def perform(serialized_event)
		event = YAML.load(serialized_event)
		ActiveRecord::Base.transaction do
			user = User.create!(email: event.data.email)
			event_store.pulish_event(UserImported.strict(data: {
				id: user.id,
				email: user.email,
			}), stream_name: "user${user.id}")
	end
	resuce User::EmailTaken => exception
	event_store.publich_event(UserAlreadyRegistered.strict(data: {
		id: exception.user_id,
		email:exception.email,
	}), stream_name: "user$#{exception.user_id}")
	end
	end
end

