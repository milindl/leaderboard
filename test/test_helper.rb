require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "webmock/test_unit"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # TODO: Refactor, this doesn"t need methods
  def valid_user
    "password"
  end
  def invalid_user
    "not #{valid_user}"
  end
  def valid_password
    "password"
  end
  def invalid_password
    "not #{valid_password}"
  end

  def valid_admin
    valid_user
  end
  def invalid_admin
    invalid_user
  end
  def valid_admin_pass
    valid_password
  end
  def invalid_admin_pass
    invalid_password
  end

  def get_valid_user
    User.create(cclogin: valid_user, password: valid_password)
  end
  def get_valid_admin
    AdminUser.create(username: valid_admin, password: valid_admin_pass)
  end

  def set_up_fake_network
    # we set up for 3 kinds of users here.
    # Valid user with valid password
    WebMock.stub_request(:post, "https://dashboard.pclub.in/api/user/login").
      with(body: "{\"username\":\"#{valid_user}\",\"password\":\"#{valid_password}\"}").
      to_return(status: 200, body: "", headers: {})

    # Valid user, but invalid password.
    WebMock.stub_request(:post, "https://dashboard.pclub.in/api/user/login").
      with(body: "{\"username\":\"#{valid_user}\",\"password\":\"#{invalid_password}\"}").
      to_return(status: 404, body: "", headers: {})

    # Invalid user, with invalid password.
    WebMock.stub_request(:post, "https://dashboard.pclub.in/api/user/login").
      with(body: "{\"username\":\"#{invalid_user}\",\"password\":\"#{invalid_password}\"}").
      to_return(status: 404, body: "", headers: {})

    WebMock.stub_request(:any, "https://search.pclub.in/api/student?username=#{valid_user}").
      to_return(status: 200, body: "{ \"n\": \"Great Person\" }")
  end

  include ApplicationHelper
end
