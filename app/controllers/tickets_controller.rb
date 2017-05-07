class TicketsController < ApplicationController
  def new
  end

  def view
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
    if a_user.is_valid_login? != true
      flash[:error] = "Ticket could not be created. Check your credentials."
      return redirect_to tickets_new_url(error_params)
    end
    if a_user.tickets.create(ticket_params).id == nil
      flash[:error] = "Ticket could not be created. Check your ticket data."
      return redirect_to tickets_new_url(error_params)
    end
    flash[:success] = "Ticket created successfully. It is pending approval."
    redirect_to root_path
  end

  def leaderboard
  end


  private
  def ticket_params
    params.permit(:points, :desc, :link, :typeof)
  end

  def error_params
    params.permit(:points, :desc, :link, :typeof, :cclogin)
  end

end
