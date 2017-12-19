RSpec.describe "Customers endpoint", type: :request do
specify "" do
	json_data = JSON.dump({
		data: {
			id: "xxxxxxxxxxx",
			type: "customers",
			attributes: {
				email: "ex@ex.com",
				password: "pass",
				toc_agreement: true,
				marketing_agreement: true,
				newsletter_agreement: true,
			}
		}
	})

	post "/users", params: json_data, headers: { "CONTENT_TYPE" =>
					      "application/vnd.api+json"}

	expect(JSON.parse(json_data)).to be_valid_jsonapi_document
	expect(request.content_type).to eq("application/vnd.api+json")

	expect(response).to have_http_status(201)
	expect(response.content_type).to eq("application/vnd.api+json")
	parsed_body = JSON.parse(response.body)
	expect(parsed_body).to be_valid_jsonapi_document
	expect(parsed_body["data"]["id"]).to eq("xxxxxxxxxxxx")
	expect(parsed_body["data"]["type"]).to eq("customers")
end
end


