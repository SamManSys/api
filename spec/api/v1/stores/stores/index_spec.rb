require 'rails_helper'

describe "stores#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stores_containers", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container1) { create(:stores_container) }
    let!(:storage_container2) { create(:stores_container) }

    it 'works' do
      expect(StoresContainerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['stores_containers'])
      expect(d.map(&:id)).to match_array([storage_container1.id, storage_container2.id])
    end
  end
end
