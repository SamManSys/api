class SpecimensController < ApplicationController
  def index
    specimens = SpecimenResource.all(params)
    respond_with(specimens)
  end

  def show
    specimen = SpecimenResource.find(params)
    respond_with(specimen)
  end

  def create
    specimen = SpecimenResource.build(params)

    if specimen.save
      render jsonapi: specimen, status: 201
    else
      render jsonapi_errors: specimen
    end
  end

  def update
    specimen = SpecimenResource.find(params)

    if specimen.update_attributes
      render jsonapi: specimen
    else
      render jsonapi_errors: specimen
    end
  end

  def destroy
    specimen = SpecimenResource.find(params)

    if specimen.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: specimen
    end
  end
end
