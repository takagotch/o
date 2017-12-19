<div id="poll1" data-id="<%= @topice.id %>"><%= @topic.num %></div></p>

<script src="http://code.jquery.com/jquery-1.10.1.mini.js"></script>
<script>
$(function()[
  //click
  //mouseover, mouseout, mousemove
  $('#poll1').click(function()[
  var id =
  var url =
  var params = [];
		    $.ajax({
			   type: '',
			   dataType: '',
			   url: url,
			   data:params,
			   timeout: 5000
		    }).done(function(data, textStatuss, jqXHR){
					 $(this).text(data.num);
		    }).fail(function(j1XHR, textStatus, errorThrown){
			    alert('EER');
			    });
  ]);
  ]);
</script>

