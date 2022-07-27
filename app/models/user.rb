class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validations
  validates :first_name, :last_name, :date_of_birth, :country_id, presence: true

  # Associations
  belongs_to :country
  has_many :transactions, dependent: :destroy
  has_many :user_points, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards

  enum loyalty_tier: { standard: 0, gold: 1, platinum: 2 }

  def country_name
    country.name
  end
end
