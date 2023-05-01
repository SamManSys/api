require 'rails_helper'

RSpec.describe "registration_to_cps#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/registration_to_cps", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:registration_to_cp)
    end
    let(:collection_protocol) {
      create(:collection_protocol)
    }
    let(:payload) do
      {
        data: {
          type: 'registration_to_cps',
          attributes: params,
          relationships: {
            collection_protocol: {
              data: {
                type: 'collection_protocol',
                id: collection_protocol.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(RegistrationToCpResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { RegistrationToCp.count }.by(1)
    end
  end
end
