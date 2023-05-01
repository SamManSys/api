class RegistrationToCpsController < ApplicationController
  def index
    registration_to_cps = RegistrationToCpResource.all(params)
    respond_with(registration_to_cps)
  end

  def show
    registration_to_cp = RegistrationToCpResource.find(params)
    respond_with(registration_to_cp)
  end

  def create
    registration_to_cp = RegistrationToCpResource.build(params)

    if registration_to_cp.save
      render jsonapi: registration_to_cp, status: 201
    else
      render jsonapi_errors: registration_to_cp
    end
  end

  def update
    registration_to_cp = RegistrationToCpResource.find(params)

    if registration_to_cp.update_attributes
      render jsonapi: registration_to_cp
    else
      render jsonapi_errors: registration_to_cp
    end
  end

  def destroy
    registration_to_cp = RegistrationToCpResource.find(params)

    if registration_to_cp.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: registration_to_cp
    end
  end
end
