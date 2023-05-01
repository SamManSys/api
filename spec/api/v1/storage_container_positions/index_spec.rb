require 'rails_helper'

RSpec.describe "storage_container_positions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/storage_container_positions", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container_position1) { create(:storage_container_position) }
    let!(:storage_container_position2) { create(:storage_container_position) }

    it 'works' do
      expect(StorageContainerPositionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['storage_container_positions'])
      expect(d.map(&:id)).to match_array([storage_container_position1.id, storage_container_position2.id])
    end
  end
end
