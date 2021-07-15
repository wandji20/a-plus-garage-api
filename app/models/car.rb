class Car < ApplicationRecord
  belongs_to :oil
  belongs_to :oil_filter
  belongs_to :brake
  belongs_to :rear_light
  belongs_to :tyre
  belongs_to :radiator_coolant
  belongs_to :fuel_pump
end
