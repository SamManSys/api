class StorageContainersController < ApplicationController
  def index
    storage_containers = StorageContainerResource.all(params)
    respond_with(storage_containers)
  end

  def show
    storage_container = StorageContainerResource.find(params)
    respond_with(storage_container)
  end

  def create
    storage_container = StorageContainerResource.build(params)

    if storage_container.save
      render jsonapi: storage_container, status: 201
    else
      render jsonapi_errors: storage_container
    end
  end

  def update
    storage_container = StorageContainerResource.find(params)

    if storage_container.update_attributes
      render jsonapi: storage_container
    else
      render jsonapi_errors: storage_container
    end
  end

  def destroy
    storage_container = StorageContainerResource.find(params)

    if storage_container.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: storage_container
    end
  end
end
