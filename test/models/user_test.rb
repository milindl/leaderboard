require 'test_helper'
require 'webmock/test_unit'

class UserTest < ActiveSupport::TestCase
  def setup
    set_up_fake_network
  end

  test "save should be possible with valid user" do
    user = User.new(cclogin: valid_user, password: valid_password)
    assert user.save
  end

  test "save should not be possible with incorrect password" do
    user = User.new(cclogin: valid_user, password: invalid_password)
    assert_not user.save
  end

  test "save should not be possible with incorrect user" do
    user = User.new(cclogin: invalid_user, password: invalid_password)
    assert_not user.save
  end
end
