class StoresContainersController < ApplicationController
  def index
    storescontainers = StoresContainerResource.all(params)
    respond_with(storescontainers)
  end

  def show
    storescontainer = StoresContainerResource.find(params)
    respond_with(storescontainer)
  end

  def create
    storescontainer = StoresContainerResource.build(params)

    if storescontainer.save
      render jsonapi: storescontainer, status: 201
    else
      render jsonapi_errors: storescontainer
    end
  end

  def update
    storescontainer = StoresContainerResource.find(params)

    if storescontainer.update_attributes
      render jsonapi: storescontainer
    else
      render jsonapi_errors: storescontainer
    end
  end

  def destroy
    storescontainer = StoresContainerResource.find(params)

    if storescontainer.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: storescontainer
    end
  end
end  
