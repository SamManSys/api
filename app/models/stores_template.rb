class StoresTemplate < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :label_x
  validates_presence_of :label_y
  validates_presence_of :size_x
  validates_presence_of :size_y    
end