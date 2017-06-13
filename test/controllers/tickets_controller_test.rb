require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest

  def setup
    set_up_fake_network
    @admin = get_valid_admin
  end

  test "should get new" do
    get tickets_new_url
    assert_response :success
    assert_select "title", full_title("New Ticket")
  end

  test "should fail to create new ticket for invalid user or invalid ticket data" do
    post tickets_create_url, params: { cclogin: invalid_user,
                                       ccpassword: invalid_password,
                                       link: "https://somelink.com" }
    assert flash[:error] == "Ticket could not be created. Check your credentials."

    # TODO: refeactor ticket_params, error_params to helpers, check redirect using
    # tickets_new_url(error_params).
    # assert_redirected_to tickets_new_url

    post tickets_create_url, params: { cclogin: valid_user,
                                       ccpassword: valid_password,
                                       link: "https somelink.com",
                                       points: 3,
                                       typeof: "ML3" }
    assert flash[:error] == "Ticket could not be created. Check your ticket data."
    # Same as above issue.
    # TODO: assert_redirected_to tickets_new_url
  end

  test "should create ticket succesfully if details are correct" do
    post tickets_create_url, params: { cclogin: valid_user,
                                       ccpassword: valid_password,
                                       link: "http://link.to",
                                       typeof: "ML",
                                       points: 4 }
    assert flash[:success] == "Ticket created successfully. It is pending approval."
    assert_redirected_to root_path
  end

  test "should redirect from approval page and changestatus if not logged in" do
    get tickets_approve_url
    assert flash[:error] == "Need login to access this page."
    assert_redirected_to login_page_path

    post tickets_changestatus_url
    assert flash[:error] == "Naughty, naughty ;). Please login."
    assert_redirected_to login_page_path
  end

  test "should get approval page if logged in" do
        post login_url, params: { session: { username: valid_admin,
                                             password: valid_admin_pass } }
        get tickets_approve_url
        assert :success
  end

  test "should changestatus if details are valid" do
    post login_url, params: { session: { username: valid_admin,
                                         password: valid_admin_pass } }
    user = get_valid_user
    ticket_details = { link: "http://link.to",
                       points: 3,
                       desc: "",
                       typeof: "ML" }
    ticket = user.tickets.create(ticket_details)

    # Approval
    post tickets_changestatus_url, params: { commit: "Approve",
                                             newpoints: 20,
                                             ticket_id: ticket.id }
    assert user.tickets.all.first.points == 20
    assert user.tickets.all.first.status == true

    # Deletion
    ticket = user.tickets.create(ticket_details)
    post tickets_changestatus_url, params: { commit: "Delete",
                                             ticket_id: ticket.id }
    assert_not user.tickets.find_by(id: ticket.id)
  end
end
