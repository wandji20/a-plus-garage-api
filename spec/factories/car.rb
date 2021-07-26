FactoryBot.define do
  factory :car do
    make { 'Yaris' }
    fuel {60}
    power {7}
    user_id { Faker::Number.unique }
  end
end


