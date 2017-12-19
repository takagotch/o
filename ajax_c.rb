#POST /topic/:id/update_num
#num + 1

def update_num
	@topic = Topic.find(params[:id])
	@topic.num + 1
	@topic.save!

	result = [
	num: @topic.num
	]
	render json: result
end

