require 'rails_helper'

RSpec.describe "storage_container_positions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/storage_container_positions/#{storage_container_position.id}"
  end

  describe 'basic destroy' do
    let!(:storage_container_position) { create(:storage_container_position) }

    it 'updates the resource' do
      expect(StorageContainerPositionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { StorageContainerPosition.count }.by(-1)
      expect { storage_container_position.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
