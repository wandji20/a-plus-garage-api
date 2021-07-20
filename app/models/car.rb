class Car < ApplicationRecord
  belongs_to :user
  has_many :parts, dependent: :destroy

  validates :make, presence: true, length: { in: (3..10) }
  validates :fuel, presence: true
  validates :power, presence: true
end
