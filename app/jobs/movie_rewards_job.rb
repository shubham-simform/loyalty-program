# frozen_string_literal: true

class MovieRewardsJob < ApplicationJob
  queue_as :default

  def perform
    users = User.joins(:transactions).where('users.created_at >= ?',
                                            Date.today - 60.days).group('users.id').select("MIN(transactions.created_at) as created_at, users.id as user_id, #{reward_id} as reward_id").where('transactions.amount >= 1000').as_json(:except => [:created_at])
    UserReward.first_or_create(users)
  end

  def reward_id
    @reward_id ||= Reward.find_or_create_by(name: Reward::FreeMovieTicket).id
  end
end
