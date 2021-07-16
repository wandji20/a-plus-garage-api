class Car < ApplicationRecord
  belongs_to :user
  has_many :parts
  
  validates :make, presence: true, length: { in: (3..10) }
  validates :fuel_rate, presence: true
  validates :horse_power, presence: true
end
