class UsersController < ApplicationController
  def leaderboard
    users = User.all
    a_user_score_pairs = users.map { |user| {:user=> user, :score=> user_score(user)} }
    a_user_score_pairs = a_user_score_pairs.sort_by { |k| k[:score] }.reverse
    a_user_score_pairs = a_user_score_pairs.map.with_index do |pair, index|
      { :index => (index + 1), :user => pair[:user], :score => pair[:score] }
    end
    @user_score_pairs = a_user_score_pairs.paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.find(params[:id])
    @user_tickets = @user.tickets.all.paginate(page: params[:page], per_page: 50)
  end

  private
  def user_score(user)
    points_list = user.tickets.all.map do |t|
      if t.status
        t.points
      else
        0
      end
    end
    points_list.sum
  end
end
