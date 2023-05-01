class PatientsController < ApplicationController
  def index
    patients = PatientResource.all(params)
    respond_with(patients)
  end

  def show
    patient = PatientResource.find(params)
    respond_with(patient)
  end

  def create
    patient = PatientResource.build(params)

    if patient.save
      render jsonapi: patient, status: 201
    else
      render jsonapi_errors: patient
    end
  end

  def update
    patient = PatientResource.find(params)

    if patient.update_attributes
      render jsonapi: patient
    else
      render jsonapi_errors: patient
    end
  end

  def destroy
    patient = PatientResource.find(params)

    if patient.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: patient
    end
  end
end
