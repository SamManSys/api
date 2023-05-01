require 'rails_helper'

RSpec.describe "specimen_collections#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/specimen_collections/#{specimen_collection.id}", params: params
  end

  describe 'basic fetch' do
    let!(:specimen_collection) { create(:specimen_collection) }

    it 'works' do
      expect(SpecimenCollectionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('specimen_collections')
      expect(d.id).to eq(specimen_collection.id)
    end
  end
end
