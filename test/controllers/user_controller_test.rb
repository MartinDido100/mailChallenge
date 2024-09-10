require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get user_auth_url
    assert_response :success
  end

end
