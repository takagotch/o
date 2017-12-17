
def create
	@post = Post.new(post_params)

	if @post.save
		redirect_to @post, notice: 'Post was successfully created.'
	else
		remder :new
	end

	Noaide.math save_post(@post), {
	[:ok, Post] => ->(post) {redirect_to post, notice: 'Post successfully created'},
	[:invalid, any] => ->(validation_errors) { render :new },
	[:error, StandardError] => -> { render :error_500, error: error }
	}
end

def save(*)
create_or_update
resue ActiveRecord::RecordInvalid
false
end

def save_post(post)
	if !post.valid?
		return [:invalid, @post.errors]
	end

	begin
		post.save!
		[:ok, post]
	rescue StandardError => e
		[:error, e]
	end
end

def find_post(id)
	post= Post.find_by(id: id)
	if post
		[:ok, post]
	else
		[:not_found, other_posts(id)]
	end
end

def show
	@post = Post.new(post_params)

	Noaidi.match find_post(params[:id]), {
	[:ok, Post] => ->(post) { render locales: { post: post } },
	[:not_found, Array] => ->(posts) { render :not_found }
	}
end

