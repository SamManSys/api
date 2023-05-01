class StorageContainerTemplatesController < ApplicationController
  def index
    storage_container_templates = StorageContainerTemplateResource.all(params)
    respond_with(storage_container_templates)
  end

  def show
    storage_container_template = StorageContainerTemplateResource.find(params)
    respond_with(storage_container_template)
  end

  def create
    storage_container_template = StorageContainerTemplateResource.build(params)

    if storage_container_template.save
      render jsonapi: storage_container_template, status: 201
    else
      render jsonapi_errors: storage_container_template
    end
  end

  def update
    storage_container_template = StorageContainerTemplateResource.find(params)

    if storage_container_template.update_attributes
      render jsonapi: storage_container_template
    else
      render jsonapi_errors: storage_container_template
    end
  end

  def destroy
    storage_container_template = StorageContainerTemplateResource.find(params)

    if storage_container_template.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: storage_container_template
    end
  end
end
