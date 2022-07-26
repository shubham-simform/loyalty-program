require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:date_of_birth) }
  end

  describe 'associations' do
    it { should have_many(:transactions) }
    it { should have_many(:user_points) }
    it { should have_many(:user_rewards) }
    it { should have_many(:rewards).through(:user_rewards) }
  end
end
