class ShipmentSamplesController < ApplicationController
  def index
    shipment_samples = ShipmentSampleResource.all(params)
    respond_with(shipment_samples)
  end

  def show
    shipment_sample = ShipmentSampleResource.find(params)
    respond_with(shipment_sample)
  end

  def create
    shipment_sample = ShipmentSampleResource.build(params)

    if shipment_sample.save
      render jsonapi: shipment_sample, status: 201
    else
      render jsonapi_errors: shipment_sample
    end
  end

  def update
    shipment_sample = ShipmentSampleResource.find(params)

    if shipment_sample.update_attributes
      render jsonapi: shipment_sample
    else
      render jsonapi_errors: shipment_sample
    end
  end

  def destroy
    shipment_sample = ShipmentSampleResource.find(params)

    if shipment_sample.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: shipment_sample
    end
  end
end
