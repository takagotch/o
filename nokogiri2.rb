require "nokogiri"

html =<< HTML

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<div>
<div class="content">
<h1><a href="http://example.com/title1">title1</a></h1>
</div>
<div class="fl_right">
<h1><a href="http://example.com/title2">title2</a></h1>
</div>
</div>
</body>
</html>
HTML

charset = 'utf-8'
doc = Nokogiri::HTML.parse(html, nil, charset)

@title = []
doc.css(".content").css(".article_box.clearfix").css(".fl_right").each do |row|
	@titles << row.css().css()
end

puts "titles.size=#[@title.size]"
@titles.each do |title|
	puts title.text
end

