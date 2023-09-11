require 'rails_helper'

RSpec.describe "sample_collections#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sample_collections/#{sample_collection.id}", params: params
  end

  describe 'basic fetch' do
    let!(:sample_collection) { create(:sample_collection) }

    it 'works' do
      expect(SampleCollectionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('sample_collections')
      expect(d.id).to eq(sample_collection.id)
    end
  end
end
