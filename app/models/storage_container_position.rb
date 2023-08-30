class StorageContainerPosition < ApplicationRecord
  belongs_to :store
  belongs_to :content, :polymorphic => true, optional: true

  validates_presence_of :position_x
  validates_presence_of :position_y
end