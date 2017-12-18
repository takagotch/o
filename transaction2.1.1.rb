begin 
	ActiveRecord::Base.transaction {
		models1.save!
		if xxx
			raise "[error] rollback!"
		end

		models2.save!
		models3.save!
	}
rescue Exception => e
	#rollback
end
