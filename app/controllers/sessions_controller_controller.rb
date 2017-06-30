class SessionsControllerController < ApplicationController
  def login
    return if session[:user].nil?
    flash[:error] = "Already logged in as #{session[:user]["username"]}"
    redirect_to leaderboard_path
  end

  def create
    user = AdminUser.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user] = user
      redirect_to tickets_approve_path
    else
      flash[:error] = "Invalid credentials."
      redirect_to login_page_path
    end
  end
end
