require 'rails_helper'

RSpec.describe "registration_to_cps#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/registration_to_cps/#{registration_to_cp.id}", payload
  end

  describe 'basic update' do
    let!(:registration_to_cp) { create(:registration_to_cp) }

    let(:payload) do
      {
        data: {
          id: registration_to_cp.id.to_s,
          type: 'registration_to_cps',
          attributes: {
            registration_identifier: 'jkhfjksd'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(RegistrationToCpResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { registration_to_cp.reload.attributes }
    end
  end
end
