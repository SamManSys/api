class CollectionProtocol < ApplicationRecord
  include ServiceModules::StatusableResource

  validates_presence_of :start_date
  validates_presence_of :short_protocol_name
end