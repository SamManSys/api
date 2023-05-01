class CollectionProtocolsController < ApplicationController
  def index
    collection_protocols = CollectionProtocolResource.all(params)
    respond_with(collection_protocols)
  end

  def show
    collection_protocol = CollectionProtocolResource.find(params)
    respond_with(collection_protocol)
  end

  def create
    collection_protocol = CollectionProtocolResource.build(params)

    if collection_protocol.save
      render jsonapi: collection_protocol, status: 201
    else
      render jsonapi_errors: collection_protocol
    end
  end

  def update
    collection_protocol = CollectionProtocolResource.find(params)

    if collection_protocol.update_attributes
      render jsonapi: collection_protocol
    else
      render jsonapi_errors: collection_protocol
    end
  end

  def destroy
    collection_protocol = CollectionProtocolResource.find(params)

    if collection_protocol.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: collection_protocol
    end
  end
end
