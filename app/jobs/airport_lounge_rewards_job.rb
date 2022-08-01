# frozen_string_literal: true

class AirportLoungeRewardsJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user.user_rewards.create(reward: load_reward) if load_user(user_id).gold?
  end

  def load_reward
    @reward ||= Reward.find_or_create_by(name: Reward::AirportLounge, description: 'description')
  end

  def load_user(id)
    @user ||= User.find(id)
  end
end
