class Country < ApplicationRecord
  #validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
