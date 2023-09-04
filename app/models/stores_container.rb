class StoresContainer < ApplicationRecord
  belongs_to :stores_template
  
  validates_presence_of :name
  validates_presence_of :size_x
  validates_presence_of :size_y
end
