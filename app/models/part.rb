class Part < ApplicationRecord
  belongs_to :car
  validates :name, presence: true
  validates :life, presence: true
  validates :count, presence: true
end
