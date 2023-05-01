require 'rails_helper'

RSpec.describe "storage_container_positions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/storage_container_positions", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:storage_container_position)
    end
    let(:storage_container) {
      create(:storage_container)
    }

    let(:payload) do
      {
        data: {
          type: 'storage_container_positions',
          attributes: params,
          relationships: {
            storage_container: {
              data: {
                type: 'storage_containers',
                id: storage_container.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(StorageContainerPositionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StorageContainerPosition.count }.by(1)
    end
  end
end
