class SampleCollectionsController < ApplicationController
  def index
    sample_collections = SampleCollectionResource.all(params)
    respond_with(sample_collections)
  end

  def show
    sample_collection = SampleCollectionResource.find(params)
    respond_with(sample_collection)
  end

  def create
    sample_collection = SampleCollectionResource.build(params)

    if sample_collection.save
      render jsonapi: sample_collection, status: 201
    else
      render jsonapi_errors: sample_collection
    end
  end

  def update
    sample_collection = SampleCollectionResource.find(params)

    if sample_collection.update_attributes
      render jsonapi: sample_collection
    else
      render jsonapi_errors: sample_collection
    end
  end

  def destroy
    sample_collection = SampleCollectionResource.find(params)

    if sample_collection.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sample_collection
    end
  end
end
