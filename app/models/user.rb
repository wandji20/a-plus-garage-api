class User < ApplicationRecord
  has_many :cars
  validates :name, presence: true
  validates :userID, presence: true, uniqueness: true
end
