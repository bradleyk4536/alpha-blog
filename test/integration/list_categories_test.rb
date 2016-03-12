require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
	
#	Poplulate table so you have items to test with
	def setup
		@category = Category.create(name: 'sports')
		@category2 = Category.create(name: 'entertainment')
	end
	
	test 'should show categories listing' do
		
		#		first get to the index page
		get categories_path
		
#		display the index page
		assert_template 'categories/index'
		
		#		make sure there are links on the category show page
		
		assert_select "a[href=?]", category_path(@category), text: @category.name
		assert_select "a[href=?]", category_path(@category2), text: @category2.name
	end
end
