def time_zone=(value)
	Time.find_zone!(value)
	super
end

def time_zone
	Time.find_zone!(self["time_zone"])
end

