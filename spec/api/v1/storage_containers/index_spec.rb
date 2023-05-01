require 'rails_helper'

RSpec.describe "storage_containers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/storage_containers", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container1) { create(:storage_container) }
    let!(:storage_container2) { create(:storage_container) }

    it 'works' do
      expect(StorageContainerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['storage_containers'])
      expect(d.map(&:id)).to match_array([storage_container1.id, storage_container2.id])
    end
  end
end
