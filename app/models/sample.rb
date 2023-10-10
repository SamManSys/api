class Sample < ApplicationRecord
  include CompatibilityView
  include ServiceModules::StatusableResource
  belongs_to :sample_collection

  validates_presence_of :label
  validates_presence_of :barcode
end
