class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  #validations
  validates :first_name, :last_name, :date_of_birth, :country, presence: true

  # Associations
  has_many :transactions, dependent: :destroy
  has_many :user_points, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards

  # Scope
  scope :created_in_last_2_month, -> { where('users.created_at >= ?', Date.today - 60.days) }
  scope :created_in_last_year, -> { where("created_at >= ?", 1.year.ago.utc)}

  enum loyalty_tier: { standard: 0, gold: 1, platinum: 2 }

  DEFAULT_COUNTRY = 'India'
end
