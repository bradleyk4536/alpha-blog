require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
	
	def setup
#		create a user to for admin test
		@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
	end

	test "get new category form and create category" do

#		Signin method to simulate someone signing in

		sign_in_as(@user, "password")

#		remember this emulates user behavior
		get new_category_path
		
#		test to see if new view exists
		assert_template 'categories/new'
		
#		create category and display somewhere
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: {name: "sports"}
		end
#		send user after creation to index
		assert_template 'categories/index'
		
		
		assert_match "sports", response.body
	end
	
	test "invalid category submission results in failure" do
		#		Signin method to simulate someone signing in

		sign_in_as(@user, "password")

		#		remember this emulates user behavior
		get new_category_path
		
#		test to see if new view exists
		assert_template 'categories/new'
		
#		create category and display somewhere
		assert_no_difference 'Category.count' do
			post categories_path, category: {name: " "}
		end
#		send user after creation to index
		assert_template 'categories/new'
		
		assert_select 'h2.panel-title'
		assert_select 'div.panel-body'
	end
end
