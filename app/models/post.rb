class Post < ActiveRecord::Base
	def Post::min_title_length
		5
	end

	def Post::max_title_length
		100
	end

	def Post::min_body_length
		5
	end

	validates :title, presence: {message: 'Titolo mancante'}
	validates :title, length: {minimum: Post::min_body_length,
	                           too_short: "Il titolo deve essere almeno di #{Post::min_body_length} caratteri",
	                           maximum: Post::max_title_length,
	                           too_long: "Il titolo deve essere al più di #{Post::max_title_length} caratteri"},
	          uniqueness: { case_sensitive: false,
	                        message: 'Esiste già un post con questo titolo' }

	validates :body, presence: {message: 'Articolo mancante'}
	validates :body, length: {minimum: Post::min_body_length,
	                             too_short: "L'articolo deve essere almeno di #{Post::min_body_length} caratteri"}
end