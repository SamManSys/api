class StorageContainer < ApplicationRecord
  belongs_to  :storage_container_template

  validates_presence_of :name
  validates_presence_of :size_x
  validates_presence_of :size_y  
end