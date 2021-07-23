require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:userID) }
  it { should validate_uniqueness_of(:userID) }
  it { should have_many(:cars) }
end
