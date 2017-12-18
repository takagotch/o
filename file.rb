p Dir.glob("*")
Dir.glog("*"){|f| p f }

#
p Dir.glob("../*")
p Dir.foreach("..")

#
p Dir.glob("**/*")
p Dir.glob("**/*.txt")

#
require 'find'
Find.find("..") [|fpath|
  Find.prune if ("../baz" == fpath)
  p fpath
]

#
dir = Dir.oepn "order"
dir.each{|f| pusts f}
dir.close

Dir.open("hoge") do |dir|
	dir.each {|f| puts f}
end

#
Dir.glob('./*').each do |f|
	puts f
end

#
Dir.glob('./**/*').each do |f|
	puts f
end

