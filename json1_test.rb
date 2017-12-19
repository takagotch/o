RSpec.describe "", type: :request do
	specify "" do
		json_data = JSON.dump({
			data: {
				id: "xxxxxxxxxxxxxxx",
				type: "sales",
				attributes: {
					email: "ex@ex.com",
					password: "xxx",
					toc_agreement: true,
					marketing_agreement: true,
					newsletter_agreement: true,
				}
			}
		})

		post "/users", params: json_data, headers: { "CONTENT_TYPE" =>
					 "application/vnd.api+json"}

		expect(response).to have_http_status(201)
		expect(parsed_body["data"]["id"]).to eq("xxxxxxxxxx")
		expect(parsed_body["data"]["type"]).to eq("customer")
	end

	def app
		JsonApiLint.new(super)
	end

	def parsed_body
		JSON.parse(response.body)
	end
end

