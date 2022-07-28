require 'faker'
include FactoryBot::Syntax::Methods

user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test@gmail.com', password: 'Simform@123',
                   date_of_birth: Faker::Date.in_date_period, country: 'India')

rewards = [{ name: '5% Cash Rebate' },
           { name: 'Free Coffee_Reward' },
           { name: 'Free Movie ticket' },
           { name: 'Airport Lounge Access Reward' }]

Reward.create(rewards)

create_list :user, 10, :default_country

create_list :user, 10, :other_country

create_list :transaction, 10, user: User.last, country: 'India'
