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
end
