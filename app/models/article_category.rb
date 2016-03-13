class ArticleCategory < ActiveRecord::Base

#	Establish association with category and article tables

	belongs_to :article
	belongs_to :category
end
