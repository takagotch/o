require 'nokogiri'

html =<<HTML
<html>
<head>
<title></title>
</head>
<body>

<div>dummy</div>
<div id="post">id/i</div>

<div id="post-1"><h2>article1</h2></div>
<div id="post-1"><h2>article2</h2></div>
<div id="post-1"><h2>article3</h2></div>

</body>
</html>
HTML

doc = nokogiri::HTML.parse(html)
doc.css('div').each do |div|
  unless div.attributes.key?() && div.attributes['id'].value =~ /\Apost-([0-9]+)\z/
    next
  end

  puts div.css('h2').text
end

