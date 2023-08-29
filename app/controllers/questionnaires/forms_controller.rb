module Questionnaires
  class FormsController < ApplicationController
    def index
      forms = FormResource.all(params)
      respond_with(forms)
    end
  
    def show
      form = FormResource.find(params)
      respond_with(form)
    end
  
    def create
      form = FormResource.build(params)
  
      if form.save
        render jsonapi: form, status: 201
      else
        render jsonapi_errors: form
      end
    end
  
    def update
      form = FormResource.find(params)
  
      if form.update_attributes
        render jsonapi: form
      else
        render jsonapi_errors: form
      end
    end
  
    def destroy
      form = FormResource.find(params)
  
      if form.destroy
        render jsonapi: { meta: {} }, status: 200
      else
        render jsonapi_errors: form
      end
    end
  end  
end
