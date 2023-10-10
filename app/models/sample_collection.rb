class SampleCollection < ApplicationRecord
  include CompatibilityView
  include ServiceModules::StatusableResource
  has_many :samples

  validates_presence_of :study_point_name  
end
