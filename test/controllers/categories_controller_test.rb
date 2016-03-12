require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	
	#	used to get id to pass to test
	def setup
		@category = Category.create(name: "sports")

#		create a user to for admin test
		@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
	end

#	First check to show all routes are present

	test "should get categories index" do
		get :index
		assert_response :success
	end

	test "should get new" do
#		simulate user is logged in thru a session hash
		session[:user_id] = @user.id
		get :new
		assert_response :success
	end

	test "should get show" do
		get(:show, { 'id' => @category.id })
		assert_response :success
	end

	test "should redirect create when admin not logged in" do
		assert_no_difference 'Category.count' do
		post :create, category: { name: "sports" }
		end
		assert_redirected_to categories_path
end
end
