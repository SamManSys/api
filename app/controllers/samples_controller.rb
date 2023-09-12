class SamplesController < ApplicationController
  def index
    samples = SampleResource.all(params.merge({stats: { total: 'count' }}))
    respond_with(samples)
  end

  def show
    sample = SampleResource.find(params)
    respond_with(sample)
  end

  def create
    sample = SampleResource.build(params)

    if sample.save
      render jsonapi: sample, status: 201
    else
      render jsonapi_errors: sample
    end
  end

  def update
    sample = SampleResource.find(params)

    if sample.update_attributes
      render jsonapi: sample
    else
      render jsonapi_errors: sample
    end
  end

  def destroy
    sample = SampleResource.find(params)

    if sample.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sample
    end
  end

  def aliquot
    aliquot_s = ServiceObjects::Sample::Aliquot.new params[:data][:id]
    aliquot_s.perform(params[:data][:attributes][:number])
    query_id = aliquot_s.new_samples.collect(&:id)
    query_id.prepend(aliquot_s.original_sample.id)
    
    sample = SampleResource.all(filter: { id: query_id})
    render jsonapi: sample
  end
end
