class User < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	has_many :ideas, :dependent => :destroy
	has_many :likes, :dependent => :destroy
	# has_many :ideas, through: :likes

	validates :name, :alias, presence: true, length: { in: 2..255 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

	validates :password, confirmation: true

	before_save do
		self.email.downcase!
	end

end
