class TicketsController < ApplicationController
  def new; end

  def approve
    if session[:user].nil?
      flash[:error] = "Need login to access this page."
      redirect_to login_page_path
    else
      @tickets = Ticket.where(status: :pending)
      render "approve"
    end
  end

  def changestatus
    if session[:user].nil?
      flash[:error] = "Naughty, naughty ;). Please login."
      return redirect_to login_page_path
    end
    if params[:commit] == "Approve"
      approve_ticket(params[:ticket_id], params[:newpoints])
    else
      remove_ticket(params[:ticket_id])
    end
  end

  def create
    cclogin = params[:cclogin]
    ccpassword = params[:ccpassword]
    a_user = User.find_by(cclogin: cclogin)
    if a_user.nil?
      a_user = User.create(cclogin: cclogin, password: ccpassword)
    else
      a_user.password = ccpassword
    end
    if a_user.valid_login? != true
      flash[:error] = "Ticket could not be created. Check your credentials."
      return redirect_to tickets_new_url(error_params)
    end
    if a_user.tickets.create(ticket_params).id.nil?
      flash[:error] = "Ticket could not be created. Check your ticket data."
      return redirect_to tickets_new_url(error_params)
    end
    flash[:success] = "Ticket created successfully. It is pending approval."
    redirect_to root_path
  end

  private

    def ticket_params
      params.permit(:points, :desc, :link, :typeof)
    end

    def error_params
      params.permit(:points, :desc, :link, :typeof, :cclogin)
    end

    def remove_ticket(ticket_id)
      t = Ticket.find_by(id: ticket_id)
      t.update_column(:status, :deleted)
    end

    def approve_ticket(ticket_id, pts)
      t = Ticket.find_by(id: ticket_id)
      t.update_column(:points, pts)
      t.update_column(:status, :approved)
    end
end
