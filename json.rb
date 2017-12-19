RSpec::Matchers.define :be_valid_jsonapi_document do
	def schema_path
	Rails.root.join("spec/support/schma.json").to_s
	end

	match do |document|
		JSON::Validator.validate(schema_path, document)
	end

	failure_message do |document|
		JSON::Validator.fully_validate(schema_path, document).join("\n")
	end
end

