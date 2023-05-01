require 'rails_helper'

RSpec.describe "storage_containers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/storage_containers/#{storage_container.id}", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container) { create(:storage_container) }

    it 'works' do
      expect(StorageContainerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('storage_containers')
      expect(d.id).to eq(storage_container.id)
    end
  end
end
