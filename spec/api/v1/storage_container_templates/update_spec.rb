require 'rails_helper'

RSpec.describe "storage_container_templates#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/storage_container_templates/#{storage_container_template.id}", payload
  end

  describe 'basic update' do
    let!(:storage_container_template) { create(:storage_container_template) }

    let(:payload) do
      {
        data: {
          id: storage_container_template.id.to_s,
          type: 'storage_container_templates',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StorageContainerTemplateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { storage_container_template.reload.attributes }
    end
  end
end
