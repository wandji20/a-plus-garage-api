require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_name) }
  it { should have_many(:cars) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_digest) }
end
