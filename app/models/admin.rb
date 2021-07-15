class Admin < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 3..10 }
  validates :email, presence: true, uniqueness: true
  validates :adminID, presence: true, uniqueness: true, length: { in: 8..18 }
end
