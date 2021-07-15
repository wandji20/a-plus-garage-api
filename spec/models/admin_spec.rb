require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:adminID) }
  it { should validate_presence_of(:adminID) }
end
