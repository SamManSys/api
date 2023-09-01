class SampleCollection < ApplicationRecord  
  has_many :samples

  default_scope { where.not(status: :disabled)}

  validates_presence_of :study_point_name
  validates_with ClosedValidator
end
