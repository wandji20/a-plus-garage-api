class User < ApplicationRecord
  has_many :cars, dependent: :destroy
  validates :name, presence: true, length: { in: 3..10 }
  validates :userID, presence: true, uniqueness: true
end
