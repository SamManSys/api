require 'rails_helper'

describe "stores_templates#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stores_templates/#{storage_container_template.id}", params: params
  end

  describe 'basic fetch' do
    let!(:storage_container_template) { create(:stores_template) }

    it 'works' do
      expect(StoresTemplateResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('stores_templates')
      expect(d.id).to eq(storage_container_template.id)
    end
  end
end
