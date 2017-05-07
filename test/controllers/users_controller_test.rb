require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get leaderboard" do
    get users_leaderboard_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
