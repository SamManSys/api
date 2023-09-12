class SampleCollection < ApplicationRecord  
  include ServiceModules::StatusableResource
  has_many :samples

  validates_presence_of :study_point_name  
end
