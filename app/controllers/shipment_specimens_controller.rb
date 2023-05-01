class ShipmentSpecimensController < ApplicationController
  def index
    shipment_specimens = ShipmentSpecimenResource.all(params)
    respond_with(shipment_specimens)
  end

  def show
    shipment_specimen = ShipmentSpecimenResource.find(params)
    respond_with(shipment_specimen)
  end

  def create
    shipment_specimen = ShipmentSpecimenResource.build(params)

    if shipment_specimen.save
      render jsonapi: shipment_specimen, status: 201
    else
      render jsonapi_errors: shipment_specimen
    end
  end

  def update
    shipment_specimen = ShipmentSpecimenResource.find(params)

    if shipment_specimen.update_attributes
      render jsonapi: shipment_specimen
    else
      render jsonapi_errors: shipment_specimen
    end
  end

  def destroy
    shipment_specimen = ShipmentSpecimenResource.find(params)

    if shipment_specimen.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: shipment_specimen
    end
  end
end
