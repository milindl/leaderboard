class TicketsHelperTest < ActionView::TestCase
  test "status boolean to word" do
    assert_equal status_word(true), "Approved"
    assert_equal status_word(false), "Pending"
  end

  test "describe link text if given" do
    ut = Ticket.new(desc: "d")
    assert_equal desc_link_text(ut), "d"
    ut = Ticket.new
    assert_equal desc_link_text(ut), "[Link]"
  end

end
