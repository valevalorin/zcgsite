require 'bcrypt'
class User < ActiveRecord::Base
	def self.authenticate (username, password)
		admin = User.take
		username = admin.username && BCrypt::Password.new(admin.hashed_password).is_password?(password)
	end
end
