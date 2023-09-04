require 'rails_helper'

RSpec.describe "sample_collections#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sample_collections/#{sample_collection.id}", payload
  end

  describe 'basic update' do
    let!(:sample_collection) { create(:sample_collection) }

    let(:payload) do
      {
        data: {
          id: sample_collection.id.to_s,
          type: 'sample_collections',
          attributes: {
            study_point_name: "Meh"
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(SampleCollectionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { sample_collection.reload.attributes }
    end
  end
end
