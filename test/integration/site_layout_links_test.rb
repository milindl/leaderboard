require 'test_helper'

class SiteLayoutLinksTest < ActionDispatch::IntegrationTest
  test "links should be present in header footer" do

    get root_path
    # A few links should be present all time, let's check here.
    assert_select "a", :href => "http://pclub.in"
    assert_select "a", :href => root_url
    assert_template 'users/leaderboard'

  end
end
