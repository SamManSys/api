class ShipmentsController < ApplicationController
  def index
    shipments = ShipmentResource.all(params)
    respond_with(shipments)
  end

  def show
    shipment = ShipmentResource.find(params)
    respond_with(shipment)
  end

  def create
    shipment = ShipmentResource.build(params)

    if shipment.save
      render jsonapi: shipment, status: 201
    else
      render jsonapi_errors: shipment
    end
  end

  def update
    shipment = ShipmentResource.find(params)

    if shipment.update_attributes
      render jsonapi: shipment
    else
      render jsonapi_errors: shipment
    end
  end

  def destroy
    shipment = ShipmentResource.find(params)

    if shipment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: shipment
    end
  end
end
