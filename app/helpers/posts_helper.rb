module PostsHelper
	def format_date_time(date_time)
		date_time.strftime('%d/%m/%Y @ %I:%M%p')
	end
	def post_details(post)
		details = []
		details << "Creato il #{format_date_time post.created_at}"
		if post.created_at != post.updated_at
			details << "Aggiornato il #{format_date_time post.updated_at}"
		end
		details
	end

	def author_detail(post)
		"Scritto da #{post.author.email}"
	end
end
