class CollectionProtocol < ApplicationRecord
  default_scope { where.not(status: :disabled)}

  validates_presence_of :start_date
  validates_presence_of :short_protocol_name
  validates_with ClosedValidator  
end