class Sample < ApplicationRecord  
  belongs_to :sample_collection
  default_scope { where.not(status: :disabled)}

  validates_presence_of :label
  validates_presence_of :barcode
  validates_with ClosedValidator
end
