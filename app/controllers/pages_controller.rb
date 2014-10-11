class PagesController < ApplicationController
	def index
		@page_title = 'RBlog'
		if params[:search].present?
			@posts = Post
			.where('title like ?', "#{params[:search]}%")
			.order('created_at DESC')
		else
			@posts = Post.all.order('created_at DESC')
		end
		render 'posts/index'
	end

	def author
		@page_title = 'Autore'
	end

	def abstract
		@page_title = 'Abstract'
	end
end
