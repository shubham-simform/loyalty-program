require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
