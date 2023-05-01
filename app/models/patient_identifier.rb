class PatientIdentifier < ApplicationRecord
  belongs_to :patient

  validates_presence_of :identifier
  validates_presence_of :identifier_type
end