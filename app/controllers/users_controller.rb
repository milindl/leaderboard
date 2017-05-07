class UsersController < ApplicationController
  def leaderboard
    users = User.all
    a_user_score_pairs = users.map { |user| {:user=> user, :score=> user_score(user)} }
    a_user_score_pairs = a_user_score_pairs.sort_by { |k| k[:score] }.reverse
    a_user_score_pairs = a_user_score_pairs.map.with_index do |pair, index|
      { :index => (index + 1), :user => pair[:user], :score => pair[:score] }
    end
    @user_score_pairs = a_user_score_pairs.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  private
  def user_score(user)
    user.tickets.all.map { |t| t.points }.sum
  end
end
