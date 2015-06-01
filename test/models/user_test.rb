require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Test Testington")
	end

	test "should have a name" do
		@user.name = "  "
		assert_not @user.valid?
	end

	test "email should be valid" do
		@user.email = "fff@.3242@sdf.net"
		assert_not @user.valid?
	end
end