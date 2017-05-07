require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tickets_new_url
    assert_response :success
  end

  test "should get view" do
    get tickets_view_url
    assert_response :success
  end

  test "should get leaderboard" do
    get tickets_leaderboard_url
    assert_response :success
  end

end
