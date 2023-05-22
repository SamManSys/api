require 'rails_helper'

RSpec.describe "samples#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/samples", payload
  end

  describe 'basic create' do
    let(:specimen_collection) { create(:specimen_collection) }
    let(:params) do
      attributes_for(:specimen)
    end
    let(:payload) do
      {
        data: {
          type: 'samples',
          attributes: params,
          relationships: {
            specimen_collection: {
              data: {
                type: 'specimen_collections',
                id: specimen_collection.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do      
      expect(SampleResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Specimen.count }.by(1)
    end
  end
end
