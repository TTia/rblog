class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	# GET /
	# GET /:page
	def home
	end

	# GET /posts
	# GET /posts.json
	def index
		#@posts = Post.all
		if params[:search].present?
			@posts = Post
			.where('title like ?', "#{params[:search]}%")
			.order('created_at DESC')
		else
			@posts = Post.all
		end
	end

	# GET /posts/1
	# GET /posts/1.json
	def show
		@page_title = @post.title
	end

	# GET /posts/new
	def new
		@post = Post.new
	end

	# GET /posts/1/edit
	def edit
	end

	# POST /posts
	# POST /posts.json
	def create
		@post = Post.new(post_params)
		@post.author = current_user

		notice_message = "Il post '#{@post.title}' è stato creato con successo."
		respond_to do |format|
			if @post.save
				format.html { redirect_to @post, notice: notice_message }
				format.json { render :show, status: :created, location: @post }
			else
				format.html { render :new }
				format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /posts/1
	# PATCH/PUT /posts/1.json
	def update
		respond_to do |format|
			if @post.update(post_params)
				notice_message = "Il post '#{@post.title}' è stato aggiornato con successo."
				format.html { redirect_to @post, notice: notice_message }
				format.json { render :show, status: :ok, location: @post }
			else
				format.html { render :edit }
				format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /posts/1
	# DELETE /posts/1.json
	def destroy
		notice_message = "Il post '#{@post.title}' è stato cancellato con successo."
		@post.destroy
		respond_to do |format|
			format.html { redirect_to posts_url, notice: notice_message }
			format.json { head :no_content }
		end
	end

	# GET /posts/autocomplete_title?title=xxx
	def autocomplete_title
		if params[:title].present?
			params[:title] = params[:title].downcase
			post_titles = Post.select([:title])
			.where('lower(title) LIKE ?', "%#{params[:title]}%")
			.order('created_at DESC')
			.limit(10);
		else
			post_titles = Post.all
			.order('created_at DESC')
			.limit(10);
		end
		result = post_titles.collect do |t|
			{title: t.title}
		end
		render json: result
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_post
		@post = Post.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def post_params
		params.require(:post).permit(:title, :body)
	end

	def require_login
		unless current_user
			redirect_to :log_in, :notice => 'Effettua il login prima.'
		end
	end

end