class UpdateLoyaltyPointsJob
  include Sidekiq::Job
  queue_as :default

  def initialize(transaction_id) 
    @transaction_id = transaction_id
  end

  def perform
    update_loyalty_points
    update_loyalty_tier
  end

  def update_loyalty_points
    user.update(loyalty_points: generated_loyalty_points + user.loyalty_points)
    user.user_points.create(earned_point: generated_loyalty_points)
  end

  def update_loyalty_tier
    loyalty_tier =
      case user.loyalty_points
      when 0...1000
        'standard'
      when 1000...5000
        'gold'
      else
        'platinum'
      end
    user.update(loyalty_tier: loyalty_tier)
    AirportLoungeRewardsJob.perform_later(user.id) if user.gold?
  end

  def generated_loyalty_points
    (transaction_amount / 100 * (user.country == User::DEFAULT_COUNTRY ? 10 : 20))
  end

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
