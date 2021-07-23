require 'rails_helper'

RSpec.describe Part, type: :model do
  it { should belong_to(:car) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:life) }
  it { should validate_presence_of(:count) }
end
