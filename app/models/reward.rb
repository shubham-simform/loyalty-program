class Reward < ApplicationRecord

  #validations
  validates :name, :description, presence: true
end
