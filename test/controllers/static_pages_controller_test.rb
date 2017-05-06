require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get help" do
    get help_url
    assert_response :success
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", full_title("Help")
  end

end
