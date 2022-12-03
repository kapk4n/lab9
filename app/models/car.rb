class Car < ApplicationRecord
  belongs_to :driver

  # validates :brand, :model, :registration_number, :engine_power, :fuel_type, presence: true
  enum fuel_type: [ :benzin, :disel, :electro ]

end
