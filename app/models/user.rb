class User < ActiveRecord::Base

	#add association to table one to many with user being the one side and articles being the many
#	and destroy all articles if deleted

	has_many :articles, dependent: :destroy

	#make sure all emails are set to lower case before being sent to database

	before_save { self.email = email.downcase }

	#add validation to username, make sure it is present, unique (ignore case sensitiveity) and have a length of 3 to 25

	validates :username, presence: true, uniqueness: { case_sensitive: false },
							length: { minimum: 3, maximum: 25 }

	#add validation to email, make sure it is ture, with a length of 105

	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: { maximum: 105 },
							uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

	#password authentication using gem bcript
	has_secure_password

end
