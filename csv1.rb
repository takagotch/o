require 'csv'

CSV.foreach("csv_1.csv", encoding: 'utf-8'){|row|
	school = School.new(name: row[0], address: row[1])
	school.save!
	puts "order saved: name=#{order.name}, address=#{school.address}"
}
#File.open("csv_1.csv", 'w:utf-8'){|f| f.print response.body}


