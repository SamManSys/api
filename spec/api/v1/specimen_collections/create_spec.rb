require 'rails_helper'

RSpec.describe "sample_collections#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/sample_collections", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:sample_collection)
    end
    let(:payload) do
      {
        data: {
          type: 'sample_collections',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SampleCollectionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SampleCollection.count }.by(1)
    end
  end
end
