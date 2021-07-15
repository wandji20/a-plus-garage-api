require 'rails_helper'

RSpec.describe Part, type: :model do
  it { should belong_to(:car) }
  it { should belong_to(:category) }
end
