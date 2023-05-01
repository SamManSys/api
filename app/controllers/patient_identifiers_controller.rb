class PatientIdentifiersController < ApplicationController
  def index
    patient_identifiers = PatientIdentifierResource.all(params)
    respond_with(patient_identifiers)
  end

  def show
    patient_identifier = PatientIdentifierResource.find(params)
    respond_with(patient_identifier)
  end

  def create
    patient_identifier = PatientIdentifierResource.build(params)

    if patient_identifier.save
      render jsonapi: patient_identifier, status: 201
    else
      render jsonapi_errors: patient_identifier
    end
  end

  def update
    patient_identifier = PatientIdentifierResource.find(params)

    if patient_identifier.update_attributes
      render jsonapi: patient_identifier
    else
      render jsonapi_errors: patient_identifier
    end
  end

  def destroy
    patient_identifier = PatientIdentifierResource.find(params)

    if patient_identifier.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: patient_identifier
    end
  end
end
