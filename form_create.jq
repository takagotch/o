
function main(){
$().tagit({
singleField: true,
available: Tags.all_tag_list
});
}

$(main);
//turbolinks;
$(document).on('page:load', main);

