class Car < ApplicationRecord
  belongs_to :user
  has_many :parts, dependent: :destroy

  accepts_nested_attributes_for :parts, reject_if: :all_blank, allow_destroy: true

  validates :make, presence: true, length: { in: (3..10) }
  validates :fuel, presence: true
  validates :power, presence: true
end
