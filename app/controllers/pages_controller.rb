class PagesController < ApplicationController
  def index
		@text = 'Home Page'
		@posts = Post.order('created_at DESC')
  end
	def author
		@text = 'Author'
	end
	def abstract
		@text = 'Why'
	end
end
