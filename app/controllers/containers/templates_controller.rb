module Containers
  class TemplatesController < ApplicationController
    def index
      templates = TemplateResource.all(params)
      respond_with(templates)
    end
  
    def show
      template = TemplateResource.find(params)
      respond_with(template)
    end
  
    def create
      template = TemplateResource.build(params)
  
      if template.save
        render jsonapi: template, status: 201
      else
        render jsonapi_errors: template
      end
    end
  
    def update
      template = TemplateResource.find(params)
  
      if template.update_attributes
        render jsonapi: template
      else
        render jsonapi_errors: template
      end
    end
  
    def destroy
      template = TemplateResource.find(params)
  
      if template.destroy
        render jsonapi: { meta: {} }, status: 200
      else
        render jsonapi_errors: template
      end
    end
  end  
end
