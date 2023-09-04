class StoresTemplatesController < ApplicationController
  def index
    storestemplates = StoresTemplateResource.all(params)
    respond_with(storestemplates)
  end

  def show
    storestemplate = StoresTemplateResource.find(params)
    respond_with(storestemplate)
  end

  def create
    storestemplate = StoresTemplateResource.build(params)

    if storestemplate.save
      render jsonapi: storestemplate, status: 201
    else
      render jsonapi_errors: storestemplate
    end
  end

  def update
    storestemplate = StoresTemplateResource.find(params)

    if storestemplate.update_attributes
      render jsonapi: storestemplate
    else
      render jsonapi_errors: storestemplate
    end
  end

  def destroy
    storestemplate = StoresTemplateResource.find(params)

    if storestemplate.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: storestemplate
    end
  end
end  
