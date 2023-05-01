require 'rails_helper'

RSpec.describe "storage_containers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/storage_containers/#{storage_container.id}", payload
  end

  describe 'basic update' do
    let!(:storage_container) { create(:storage_container) }

    let(:payload) do
      {
        data: {
          id: storage_container.id.to_s,
          type: 'storage_containers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StorageContainerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { storage_container.reload.attributes }
    end
  end
end
