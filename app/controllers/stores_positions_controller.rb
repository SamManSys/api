class StoresPositionsController < ApplicationController
  def index
    positions = StoresPositionResource.all(params)
    respond_with(positions)
  end

  def show
    position = StoresPositionResource.find(params)
    respond_with(position)
  end
 
  def update
    position = StoresPositionResource.find(params)

    if position.update_attributes
      render jsonapi: position
    else
      render jsonapi_errors: position
    end
  end
end  