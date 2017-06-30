require "test_helper"

class TicketTest < ActiveSupport::TestCase
  def setup
    set_up_fake_network
    @user = User.create(cclogin: valid_user, password: valid_password)
    @ticket_details = { link: "http://valid.site.com/",
                       points: 3,
                       desc: "",
                       typeof: "ML" }
    @ticket = @user.tickets.new(@ticket_details)
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

  test "should not add duplicate Pending ticket" do
    @ticket.save
    duplicate_ticket = @user.tickets.new(@ticket_details)
    assert_not duplicate_ticket.save
  end

  test "should add duplicate even if approved ticket exists" do
    @ticket.save
    t = Ticket.find_by(id: @ticket.id)
    t.update_column(:status, :approved)

    duplicate_ticket = @user.tickets.new(@ticket_details)
    assert duplicate_ticket.save
  end

  test "should add duplicate even if deleted ticket exists" do
    @ticket.save
    t = Ticket.find_by(id: @ticket.id)
    t.update_column(:status, :deleted)

    duplicate_ticket = @user.tickets.new(@ticket_details)
    assert duplicate_ticket.save
  end
end
