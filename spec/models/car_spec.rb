require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:power) }
  it { should validate_presence_of(:fuel) }
  it { should belong_to(:user) }
  it { should have_many(:parts) }
end
