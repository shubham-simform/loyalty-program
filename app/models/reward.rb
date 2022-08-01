class Reward < ApplicationRecord

  #validations
  validates :name, :description, presence: true

  AirportLounge = 'Airport Lounge Access Reward'
  CashRebate = "5 % Cash Rebate"
  FreeCoffeeReward = 'Free Coffee Reward'
  FreeMovieTicket = 'Free Movie ticket'

end
