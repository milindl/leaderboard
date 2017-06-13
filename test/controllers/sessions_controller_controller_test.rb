require 'test_helper'

class SessionsControllerControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = get_valid_admin
  end

  test "should get login page" do
    get login_url
    assert_response :success
    assert_select "title",  full_title("Log in")
  end

  test "should redirect when credentials are invalid" do
    post login_url, params: { session: { username: invalid_admin,
                                         password: invalid_admin_pass } }
    assert flash[:error] == "Invalid credentials."
    assert_redirected_to login_url
  end

  test "should redirect when credentials are valid" do
    post login_url, params: { session: { username: valid_admin,
                                         password: valid_admin_pass } }
    assert session[:user]
    assert session[:user][:username] == valid_user
    assert_redirected_to tickets_approve_path
  end

  test "should redirect when already logged in" do
    post login_url, params: { session: { username: valid_admin,
                                         password: valid_admin_pass } }
    get login_url
    assert_redirected_to leaderboard_path
  end

end
