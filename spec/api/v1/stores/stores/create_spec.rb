require 'rails_helper'

describe "stores_container#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/stores_containers", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:stores_container)
    end
    let(:stores_template) do
      create(:stores_template)
    end

    let(:payload) do
      {
        data: {
          type: 'stores_containers',
          attributes: params,
          relationships: {
            stores_template: {
              data: {
                type: 'stores_templates',
                id: stores_template.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(StoresContainerResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StoresContainer.count }.by(1)
    end
  end
end

