class TicketsHelperTest < ActionView::TestCase
  test "full title should work correctly" do
    assert_equal full_title, "PClub IITK Leaderboard"
    assert_equal full_title("PT"), "PT | PClub IITK Leaderboard"
  end

end
