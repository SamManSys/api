class Shipment < ApplicationRecord  
  include ServiceModules::StatusableResource

  validates_presence_of :name
  validates_presence_of :date
end
