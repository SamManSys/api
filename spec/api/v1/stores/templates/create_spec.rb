require 'rails_helper'

describe "templates#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/stores_templates", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:stores_template)
    end
    let(:payload) do
      {
        data: {
          type: 'stores_templates',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StoresTemplateResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StoresTemplate.count }.by(1)
    end
  end
end
