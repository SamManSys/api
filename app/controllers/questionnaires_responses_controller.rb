class QuestionnairesResponsesController < ApplicationController
  def index
    responses = QuestionnairesResponseResource.all(params)
    respond_with(responses)
  end

  def show
    response = QuestionnairesResponseResource.find(params)
    respond_with(response)
  end

  def create
    response = QuestionnairesResponseResource.build(params)

    if response.save
      render jsonapi: response, status: 201
    else
      render jsonapi_errors: response
    end
  end

  def update
    response = QuestionnairesResponseResource.find(params)

    if response.update_attributes
      render jsonapi: response
    else
      render jsonapi_errors: response
    end
  end

  def destroy
    response = QuestionnairesResponseResource.find(params)

    if response.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: response
    end
  end
end  
