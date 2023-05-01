require 'rails_helper'

RSpec.describe "storage_containers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/storage_containers", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:storage_container)
    end
    let(:storage_container_template) do
      create(:storage_container_template)
    end

    let(:payload) do
      {
        data: {
          type: 'storage_containers',
          attributes: params,
          relationships: {
            storage_container_template: {
              data: {
                type: 'storage_container_templates',
                id: storage_container_template.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(StorageContainerResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StorageContainer.count }.by(1)
    end
  end
end
