FactoryBot.define do
  factory :part do
    id { 1 }
    name { 'Oil' }
    life { 3 }
    count { 1 }
    car_id { 1 }
  end
end
