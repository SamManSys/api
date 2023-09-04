require 'rails_helper'

RSpec.describe "sample_collections#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sample_collections", params: params
  end

  describe 'basic fetch' do
    let!(:sample_collection1) { create(:sample_collection) }
    let!(:sample_collection2) { create(:sample_collection) }

    it 'works' do
      expect(SampleCollectionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['sample_collections'])
      expect(d.map(&:id)).to match_array([sample_collection1.id, sample_collection2.id])
    end
  end
end
