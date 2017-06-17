require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  def setup
    set_up_fake_network
    @user = User.create(cclogin: valid_user, password: valid_password)
    @ticket = @user.tickets.new
    @ticket.link = "http://valid.site.com/"
    @ticket.desc = "A good ticket"
    @ticket.typeof = "ML"
    @ticket.points = 3
  end

  test "invalid links on the ticket should prevent creation" do
    old_link = @ticket.link
    @ticket.link = "htttp://hahanot a link/"
    assert_not @ticket.save
    @ticket.link = old_link
  end

  test "invalid typeof on the ticket should prevent creation" do
    old_typeof = @ticket.typeof
    @ticket.link = "not a valid type #1"
    assert_not @ticket.save
    @ticket.typeof = old_typeof
  end

  test "valid ticket should be created" do
    assert @ticket.save
  end

  test "ticket should have Pending status initially" do
    assert @ticket.pending?
  end

end
