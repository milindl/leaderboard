class UsersController < ApplicationController
  def leaderboard
    a_user_score_pairs = User.all.map do |user|
      {
        user: user,
        score: net_score(user.tickets.all),
        month_score: net_score(user.tickets.all_this_month)
      }
    end

    add_ranks_by_score!(a_user_score_pairs, :month_score, :month_index)
    add_ranks_by_score!(a_user_score_pairs, :score, :index)
    @user_score_pairs = a_user_score_pairs.paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.find(params[:id])
    @user_tickets = @user.tickets.all.paginate(page: params[:page], per_page: 50)
  end

  private

    def net_score(user_ticket_list)
      user_ticket_list.approved.sum(&:points)
    end

    def add_ranks_by_score!(score_pairs, score, rank_name)
      score_pairs = score_pairs.sort_by { |k| k[score] }.reverse
      score_pairs.map.with_index do |pair, index|
        pair[rank_name] = index + 1
        pair
      end
    end
end
