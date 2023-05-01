require 'rails_helper'

RSpec.describe "specimen_collections#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/specimen_collections/#{specimen_collection.id}"
  end

  describe 'basic destroy' do
    let!(:specimen_collection) { create(:specimen_collection) }

    it 'updates the resource' do
      expect(SpecimenCollectionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SpecimenCollection.count }.by(-1)
      expect { specimen_collection.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
