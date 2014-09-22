class Post < ActiveRecord::Base
end
=begin
class Post < ActiveRecord::Base
	def self.min_title_length
		5
	end

	def self.max_title_length
		100
	end

	def self.min_content_length
		5
	end

	validates :title, :content, presence: true
	validates :content, length: {minimum: Post::min_content_length,
	                             too_short: "%{count} caratteri sono troppo pochi per un post sensato!"}
	validates :title, length: {minimum: 5,
	                           too_short: "%{count} caratteri sono troppo pochi per un titolo!",
	                           maximum: 100,
	                           too_long: "%{count} caratteri sono troppi per un titolo!"},
	          uniqueness: true
	public
end
=end