class Category < ActiveRecord::Base

	has_many :article_categories
	has_many :articles, through: :article_categories

	#	test to see if name of category is present and length is 3 to 25
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }

#	test to see if category name is unique
	validates_uniqueness_of :name


end
