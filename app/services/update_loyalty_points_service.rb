class UpdateLoyaltyPointsService < ApplicationService
  
  def initialize(transaction_id) 
    @transaction_id = transaction_id
  end

  def call
    update_loyalty_points
    update_loyalty_tier
  end

  def update_loyalty_points
    user.update(loyalty_points: generated_loyalty_points + user.loyalty_points)
    user.user_points.create(earned_point: generated_loyalty_points)
  end

  def update_loyalty_tier
    loyalty_tier = if (0...1000) === user.loyalty_points
                    'standard'
                  elsif (1000...5000) === user.loyalty_points
                    'gold'
                  else
                    'platinum'
                  end
    user.update(loyalty_tier: loyalty_tier)
    AirportLoungeRewardsJob.perform_later(user.id) if user.gold?
  end

  def generated_loyalty_points
    if transaction_amount >= 100 && user.country == User::DEFAULT_COUNTRY
      earned_amount = transaction_amount / 10
    elsif user.country != User::DEFAULT_COUNTRY
      earned_amount = (transaction_amount / 10) * 2
    end
    earned_amount.round
  end

  private

    def user
      @user ||= transaction.user
    end

    def transaction_amount
      @transaction_amount ||= transaction.amount
    end

    def transaction
      @transaction ||= Transaction.find(@transaction_id)
    end

end
