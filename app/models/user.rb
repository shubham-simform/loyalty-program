class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validations
  validates :first_name, :last_name, :date_of_birth, :country_id, presence: true

  # Associations
  belongs_to :country
  has_many :transactions
end
