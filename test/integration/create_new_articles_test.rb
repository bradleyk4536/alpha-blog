require 'test_helper'



class CreateNewArticlesTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = User.create(username: "joejohn", email: "joejohn@yahoo.com", password: "password", admin: false )
	end
	
	test "get new article form and create new article" do
		sign_in_as(@user, "password")
		get new_article_path
		assert_template 'articles/new'
		assert_difference 'Article.count', 1 do
			post_via_redirect articles_path, article: { title: "Audi Cars", description: "Fine German Engineering", user_id: 1 }
	end
		assert_template 'articles/show'
		assert_match 'Audi Cars', response.body
end
	
end