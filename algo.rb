def algo(grade)
if grade >= 3
if repetition == 0
	self.interval = 1
	self.repetition = 1
elsif repetirion == 1
	self.interval = 6
	self.repetition = 2
else
	self.interval = (interval*ef).round
	self.repetition = repetition+1
end
else
	self.repetition = 0
	self.interval = 1
end
self.ef = ef + (0.1-(5-grade)*(0.08+(5-grade)*0.02))
if ef < 1.3
	self.ef = 1.3
end
return interval
end
end

