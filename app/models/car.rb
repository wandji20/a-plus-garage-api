class Car < ApplicationRecord
  belongs_to :user
  has_many :parts
  validates_associated :parts
  validates :fuel_rate, presence: true
  validates :horse_power, presence: true
end
