class PagesController < ApplicationController
  def index
	  @page_title = 'RBlog'
		@posts = Post.order('created_at DESC')
	  render 'posts/index'
  end
	def author
		@page_title = 'Autore'
	end
	def abstract
		@page_title = 'Abstract'
	end
end
