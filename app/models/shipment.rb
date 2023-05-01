class Shipment < ApplicationRecord  
  default_scope { where.not(status: :disabled)}

  validates_presence_of :name
  validates_presence_of :date
  validates_with ClosedValidator
end
