class Transaction < ApplicationRecord

  # Validation
  validates :amount, :user_id, :country, presence: true
  
  # Associations
  belongs_to :user

end
