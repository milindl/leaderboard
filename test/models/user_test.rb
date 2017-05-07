require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(cclogin: 'dummy', password: 'dummy')
  end
  # These tests are not very useful since I cannot use an actual
  # user, as that would compromise their CC login
  test "save should not be possible with dummy user" do
    assert_not @user.save
  end
end

