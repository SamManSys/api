require 'rails_helper'

RSpec.describe "storage_container_positions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/storage_container_positions/#{storage_container_position.id}", payload
  end

  describe 'basic update' do
    let!(:storage_container_position) { create(:storage_container_position) }

    let(:payload) do
      {
        data: {
          id: storage_container_position.id.to_s,
          type: 'storage_container_positions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StorageContainerPositionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { storage_container_position.reload.attributes }
    end
  end
end
