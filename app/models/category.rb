class Category < ApplicationRecord
  has_many :parts, dependent: :destroy
  validates :name, presence: true, length: { in: 3..10 }
end
