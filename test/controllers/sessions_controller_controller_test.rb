require 'test_helper'

class SessionsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get sessions_controller_login_url
    assert_response :success
  end

end
