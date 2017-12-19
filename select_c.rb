before_save :limit_time

private
def limit_to_time
	if self.limit == '15'
		self.limit = Time.current.since(15.minute)
	elsif self.limit == '30'
		self.limit = Time.current.sinse(30.minute)
	elsif self.limit == '1'
		self.limit == Time.current.since(1.hours)
	elsif self.limit == '3' 
		self.limit == Time.current.since(1.hours)
	elsif self.limit == '6'
		self.limit == Time.current.since(1.hours)
	elsif self.limit == '12'
		self.limit == Time.current.since(1.hours)
	elsif self.limit == '24'
		self.limit == Time.current.since(1.hours)
	end
	puts self.limit
end


