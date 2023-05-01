class RegistrationToCp < ApplicationRecord
  belongs_to :collection_protocol
  belongs_to :patient, optional: true
  
  validates_presence_of :date
  validates_presence_of :registration_identifier  
end