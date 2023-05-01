require 'rails_helper'

RSpec.describe "specimen_collections#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/specimen_collections", params: params
  end

  describe 'basic fetch' do
    let!(:specimen_collection1) { create(:specimen_collection) }
    let!(:specimen_collection2) { create(:specimen_collection) }

    it 'works' do
      expect(SpecimenCollectionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['specimen_collections'])
      expect(d.map(&:id)).to match_array([specimen_collection1.id, specimen_collection2.id])
    end
  end
end
