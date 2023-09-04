class QuestionnairesFormsController < ApplicationController
  def index
    forms = QuestionnairesFormResource.all(params)
    respond_with(forms)
  end

  def show
    form = QuestionnairesFormResource.find(params)
    respond_with(form)
  end

  def create
    form = QuestionnairesFormResource.build(params)

    if form.save
      render jsonapi: form, status: 201
    else
      render jsonapi_errors: form
    end
  end

  def update
    form = QuestionnairesFormResource.find(params)

    if form.update_attributes
      render jsonapi: form
    else
      render jsonapi_errors: form
    end
  end

  def destroy
    form = QuestionnairesFormResource.find(params)

    if form.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: form
    end
  end
end  
