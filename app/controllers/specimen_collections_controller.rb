class SpecimenCollectionsController < ApplicationController
  def index
    specimen_collections = SpecimenCollectionResource.all(params)
    respond_with(specimen_collections)
  end

  def show
    specimen_collection = SpecimenCollectionResource.find(params)
    respond_with(specimen_collection)
  end

  def create
    specimen_collection = SpecimenCollectionResource.build(params)

    if specimen_collection.save
      render jsonapi: specimen_collection, status: 201
    else
      render jsonapi_errors: specimen_collection
    end
  end

  def update
    specimen_collection = SpecimenCollectionResource.find(params)

    if specimen_collection.update_attributes
      render jsonapi: specimen_collection
    else
      render jsonapi_errors: specimen_collection
    end
  end

  def destroy
    specimen_collection = SpecimenCollectionResource.find(params)

    if specimen_collection.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: specimen_collection
    end
  end
end
