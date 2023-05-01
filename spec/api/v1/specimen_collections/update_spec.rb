require 'rails_helper'

RSpec.describe "specimen_collections#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/specimen_collections/#{specimen_collection.id}", payload
  end

  describe 'basic update' do
    let!(:specimen_collection) { create(:specimen_collection) }

    let(:payload) do
      {
        data: {
          id: specimen_collection.id.to_s,
          type: 'specimen_collections',
          attributes: {
            study_point_name: "Meh"
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(SpecimenCollectionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { specimen_collection.reload.attributes }
    end
  end
end
