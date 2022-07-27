class UserReward < ApplicationRecord
  
  # associations
  belongs_to :user
  belongs_to :reward

  enum status: { active: 0, inactive: 1 }
end
