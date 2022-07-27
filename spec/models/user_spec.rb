require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:date_of_birth) }
  end

  describe 'associations' do
    it { should belong_to(:country) }
    it { should have_many(:transactions) }
  end
end
