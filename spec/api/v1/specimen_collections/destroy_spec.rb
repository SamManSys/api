require 'rails_helper'

RSpec.describe "sample_collections#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sample_collections/#{sample_collection.id}"
  end

  describe 'basic destroy' do
    let!(:sample_collection) { create(:sample_collection) }

    it 'updates the resource' do
      expect(SampleCollectionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SampleCollection.count }.by(-1)
      expect { sample_collection.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
