require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

#	First check to show all routes are present

	test "should get categories index" do
		get :index
		assert_response :success
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should get show" do
		get :show
		assert_response :success
	end

end