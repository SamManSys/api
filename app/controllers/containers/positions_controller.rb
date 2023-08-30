module Containers
  class PositionsController < ApplicationController
    def index
      positions = PositionResource.all(params)
      respond_with(positions)
    end
  
    def show
      position = PositionResource.find(params)
      respond_with(position)
    end
   
    def update
      position = PositionResource.find(params)
  
      if position.update_attributes
        render jsonapi: position
      else
        render jsonapi_errors: position
      end
    end
  end  
end
