require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def test_links
    # Some links should always be present on each page.
    # assert_select "a", :href => root_url
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", full_title("Help")
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", full_title

    # A few links should be present all time, let's check here.
    assert_select "a", :href => "http://pclub.in"
    assert_select "a", :href => root_url

    test_links
  end

end
