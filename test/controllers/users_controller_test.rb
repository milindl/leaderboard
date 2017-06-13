require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    set_up_fake_network
    @user = get_valid_user
  end

  test "should get leaderboard" do
    get leaderboard_url
    assert_response :success
  end

  test "should get show" do
    get show_url(id: @user.id)
    assert_response :success
  end

end
