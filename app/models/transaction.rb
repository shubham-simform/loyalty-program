class Transaction < ApplicationRecord

  # Validation
  validates :amount, :user_id, :country, presence: true
  
  # Associations
  belongs_to :user

  after_create :update_loyalty_points

  def update_loyalty_points
    UpdateLoyaltyPointsJob.perform_async(id)
  end
end
