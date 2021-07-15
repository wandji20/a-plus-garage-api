require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:horse_power) }
  it { should validate_presence_of(:fuel_rate) }
  it { should belong_to(:user) }
end
