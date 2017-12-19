require 'nokogiri'

html =<<HTML
<form action="xxx" method="post">
xxx
<input type="submit" name="button" value="button1">
<input type="submit" name="button" value="button1">
xxx
</form>
HTML

if params[:button1]
#button1
else if params[:button2]
#button2
end

