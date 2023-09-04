require 'rails_helper'

RSpec.describe "samples#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/samples", payload
  end

  describe 'basic create' do
    let(:sample_collection) { create(:sample_collection) }
    let(:params) do
      attributes_for(:sample)
    end
    let(:payload) do
      {
        data: {
          type: 'samples',
          attributes: params,
          relationships: {
            sample_collection: {
              data: {
                type: 'sample_collections',
                id: sample_collection.id.to_s
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
      }.to change { Sample.count }.by(1)
    end
  end
end
