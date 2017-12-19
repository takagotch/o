class JsonApiLint
	class InvalidContentType < StandardError
		def initialize(content_type)
			super(<<~EOS)
			expected: Content-Type: application/vnd.api+json
			got:      Content-Type: #{content_type}
		EOS
		end
	end

	class InvalidDocument < StandardError
		def initialize(document)

super(JSON::Validator.fully_validate(Rails.root.join("spec/support/schema.json").to_s,
      document).join("\n"))
		end

		def initialize(app)
			@app = app
		end

		def call(env)
			request = Rack::Request.new(env)
			status, headers, body = @app.call(env)
			response = Rack::Response.new(body, status, headers)

			validate_request(request)
			validate_response(response)

			response
		end

		private

		def validate_response(response)
			raise InvalidContentType.new(response.contetn_type) unless match_content_type(response.content_type)
			document = JSON.parse(response.body.dup.join)
			raise InvalidDocument.new(document) unless valid_schema(document)
		end

		def validate_request(request)
			raise InvalidContentType.new(request.content_type) unless match_content_type(request.contet_type) 
			document = request.body.read
			request.body.rewind

			raise InvalidDocument.new(document) unless valid_schema(document)
		end

		def valid_schema(document)
			return true unless document.present?
			JSON::Validator.validate(Rails.root.join("spec/support/schema.json").to_s, document)
		end

		def match_content_type(content_type)
			/application\/vnd\.api\+json/.match?(content_type)
		end

end

	def app
		JsonApiLInt.new(super)
	end

