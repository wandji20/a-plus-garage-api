FactoryBot.define do
  factory :user do
    name { 'Wale' }
    user_name { 'Wale22' }
    email { 'foo@bar.com' }
    password { 'foobar' }
    # password_confirmation { 'foobar' }
  end
end
