require 'rails_helper'

RSpec.describe "storage_container_templates#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/storage_container_templates", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:storage_container_template)
    end
    let(:payload) do
      {
        data: {
          type: 'storage_container_templates',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StorageContainerTemplateResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StorageContainerTemplate.count }.by(1)
    end
  end
end
