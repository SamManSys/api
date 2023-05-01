class StorageContainerPosition < ApplicationRecord
  belongs_to :storage_container
  belongs_to :content, :polymorphic => true, optional: true

  validates_presence_of :position_x
  validates_presence_of :position_y

end