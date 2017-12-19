require 'nokogiri'

doc = Nokogiri::HTML.parse(html, nil, charset)

@titles = []
doc.css(".content").css(".article_box").css(".fl_right").each do |row|
	@titles << row.css("h1").css("a")
end



