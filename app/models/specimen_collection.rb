class SpecimenCollection < ApplicationRecord  
  has_many :specimens

  default_scope { where.not(status: :disabled)}

  validates_presence_of :study_point_name
  validates_with ClosedValidator
end
