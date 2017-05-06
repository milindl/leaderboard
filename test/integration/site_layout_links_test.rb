require 'test_helper'

class SiteLayoutLinksTest < ActionDispatch::IntegrationTest
  test "links should be present in header footer" do
    get root_path
    assert_template 'static_pages/help'
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', 'http://pclub.in'
  end
end
