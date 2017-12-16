class Order < ActiveRecord::Base
has_one :meta_data, dependent: :destroy, autosave: true

def meta_data
	super || build_meta_data
end

delegate :ip_address, :ip_address=
	 :user_agent, :user_agent=
	 to: :meta_data,
	 prefix: false
end

context "retries" do
	around do |o|
		begin
			seed = Kernel.srand(5566)
			o.run
		ensure
			Kernel.srand(seed)
		end
	end


def capture(order_id)
	client = Savon.client(
		wsdl: static_cinfiguration.goods_shipped_url,
		logger: Rails.logger,
		log_level: :debug,
		log: true,
		ssl_version: :TLSv1,
	)

	data = {
		companyID: static_configuration.company_id.to_s,
		orderID:   order_id,
		retailerID: static_configuration.retailer_id.to_s,
	}.tap do |params|
		params[] = HashGuard.new(
			static_configuration.shared_secret
		).calculate(params.values)
	end

	response = client.call(
	:goods_shipped,
	message: data,
	)
end

order.ip_address = request.remote_ip
order.save!

