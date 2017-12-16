class SendingBusinessMetricsTest < AcceptanceTestCase
	def setup
	@name, @email, @token = "Rere", "email@example.org", '0123456789012345678'
	@app = TestApp.new(@token)
	@admin = TestAdmin.new
	@owner = TestOwner.new(@email)
	@scheduler = TestScheduler.new
	end

	def test_client_delivers_business_metrics
		@admin.add_project(@name, @token)
		@admin.add_recipients(@email)

		@app.create_entity!("Dog")

		@scheduler.invoke_daily_report

		@owner.visit_last_email do |email|
			email.find("h1").has!("Daily report")
			email.find("p").has!("Dog: 1")
		end
	end
end

