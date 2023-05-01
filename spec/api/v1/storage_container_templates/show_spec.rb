require 'rails_helper'

RSpec.describe "storage_container_templates#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/storage_container_templates/#{storage_container_template.id}", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container_template) { create(:storage_container_template) }

    it 'works' do
      expect(StorageContainerTemplateResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('storage_container_templates')
      expect(d.id).to eq(storage_container_template.id)
    end
  end
end
