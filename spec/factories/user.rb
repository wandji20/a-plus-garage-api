FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    userID {'Wale22'}
    email {'foo@bar.com'}
    password {'foobar'}
  end
end