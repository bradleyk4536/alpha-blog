class Article < ActiveRecord::Base

	#add association one to many with article being the many side and user the one

	belongs_to :user

	#establish association with article_category

	has_many :article_categories
	has_many :categories, through: :article_categories

	#add validation to title, make sure present, and length is 3 to 50

	validates :title, presence: true, length: {minimum: 3, maximum: 50 }

	#add validation to descirption, make sure it is present with length fo 10 to 300

	validates :description, presence: true, length: {minimum: 10, maximum: 300 }

	#add validation to ensure all articles have a user_id

	validates :user_id, presence: true
end
