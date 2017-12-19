html = Crawl.new.get_html("https://www.yahoo.co.jp/company/srv/?srcmode=pref&p=13")
doc = Nokogiri::parse(html)
doc.css('div.UvsinfoBx').each do |div|
	puts div.css('h3').first.text.to_s
end

