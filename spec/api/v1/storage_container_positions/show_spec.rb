require 'rails_helper'

RSpec.describe "storage_container_positions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/storage_container_positions/#{storage_container_position.id}", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container_position) { create(:storage_container_position) }

    it 'works' do
      expect(StorageContainerPositionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('storage_container_positions')
      expect(d.id).to eq(storage_container_position.id)
    end
  end
end
