def top
require "open-uri"
require "nokogiri"

@titles = []
(2..5).each do |i|
	url = "https://myblog.com/alexander1203/entrylist-#[i].html"
	user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppliWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.15.00.63 Safari/537.36'
	charset = nil
	html = open(url, "User-Agent" => user_agent) do |f|
		charset = f.charset
		f.read
	end
	doc = Nokogiti::HTML.parse(html, nil, charset)
	#@titles = []
	doc.css("#main > div.skin-blogArchive > div.skin-blogArchiveBody.skin-bgMain > ul > ul > li> div> div:nth-child(2) >h2 >a").each do |row|
	@titles << row
end
end
end

