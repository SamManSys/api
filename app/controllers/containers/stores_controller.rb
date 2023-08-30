module Containers
  class StoresController < ApplicationController
    def index
      stores = StoreResource.all(params)
      respond_with(stores)
    end
  
    def show
      store = StoreResource.find(params)
      respond_with(store)
    end
  
    def create
      store = StoreResource.build(params)
  
      if store.save
        render jsonapi: store, status: 201
      else
        render jsonapi_errors: store
      end
    end
  
    def update
      store = StoreResource.find(params)
  
      if store.update_attributes
        render jsonapi: store
      else
        render jsonapi_errors: store
      end
    end
  
    def destroy
      store = StoreResource.find(params)
  
      if store.destroy
        render jsonapi: { meta: {} }, status: 200
      else
        render jsonapi_errors: store
      end
    end
  end  
end
