require 'test_helper.rb'

class UsersControllerTest < ActionController::TestCase
	def setup
		@user = users(:curt)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

end