class Author < ActiveRecord::Base
	has_many :posts

	validates :email, presence: true,
	          :uniqueness => true
	validates :hpassword, presence: true

	before_save :hash_password

	def hash_password
		if hpassword.present?
			self.hsalt = BCrypt::Engine.generate_salt
			self.hpassword = BCrypt::Engine.hash_secret(self.hpassword, self.hsalt)
		end
	end

	def self.authenticate(email, password)
		user = find_by_email(email)

		if user && user.hpassword == BCrypt::Engine.hash_secret(password, user.hsalt)
			user
		else
			nil
		end
	end
end
