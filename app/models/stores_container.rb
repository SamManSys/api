class StoresContainer < ApplicationRecord
  belongs_to :stores_template
  
  validates_presence_of :name
  validates_presence_of :size_x
  validates_presence_of :size_y

  after_save do
    1.upto(self.size_x).each do |x|
      1.upto(self.size_y).each do |y|
        StoresPosition.create! stores_container: self, position_x: x, position_y: y
      end
    end
  end
end
