require 'rails_helper'

RSpec.describe "specimen_collections#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/specimen_collections", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:specimen_collection)
    end
    let(:payload) do
      {
        data: {
          type: 'specimen_collections',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SpecimenCollectionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SpecimenCollection.count }.by(1)
    end
  end
end
