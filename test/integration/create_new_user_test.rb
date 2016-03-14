require 'test_helper'

class CreateNewUsersTest < ActionDispatch::IntegrationTest
	
	test "get new user form and create new user" do
		
		get signup_path
		assert_template 'users/new'
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: {username: "jimbob", email: "jimbob@yahoo.com", password: 'password'}
		end
		assert_template 'users/show'
		assert_match "jimbob", response.body
	end
end