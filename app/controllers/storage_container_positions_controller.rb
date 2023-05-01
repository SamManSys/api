class StorageContainerPositionsController < ApplicationController
  def index
    storage_container_positions = StorageContainerPositionResource.all(params)
    respond_with(storage_container_positions)
  end

  def show
    storage_container_position = StorageContainerPositionResource.find(params)
    respond_with(storage_container_position)
  end

  def create
    storage_container_position = StorageContainerPositionResource.build(params)

    if storage_container_position.save
      render jsonapi: storage_container_position, status: 201
    else
      render jsonapi_errors: storage_container_position
    end
  end

  def update
    storage_container_position = StorageContainerPositionResource.find(params)

    if storage_container_position.update_attributes
      render jsonapi: storage_container_position
    else
      render jsonapi_errors: storage_container_position
    end
  end

  def destroy
    storage_container_position = StorageContainerPositionResource.find(params)

    if storage_container_position.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: storage_container_position
    end
  end
end
