require 'test_helper'

class TicketsHelperTest < ActionView::TestCase
  def setup
    set_up_fake_network
    @user = User.create(cclogin: valid_user, password: valid_password)
    @ticket = @user.tickets.new
  end

  test "should give status_word" do
    @ticket.status = :pending
    assert_equal status_word(@ticket.status), "Pending"

    @ticket.status = :approved
    assert_equal status_word(@ticket.status), "Approved"

    @ticket.status = :deleted
    assert_equal status_word(@ticket.status), "Deleted"
  end

  test "describe link text if given" do
    ut = Ticket.new(desc: "d")
    assert_equal desc_link_text(ut), "d"
    ut = Ticket.new
    assert_equal desc_link_text(ut), "[Link]"
  end

end
