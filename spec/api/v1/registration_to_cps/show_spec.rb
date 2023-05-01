require 'rails_helper'

RSpec.describe "registration_to_cps#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/registration_to_cps/#{registration_to_cp.id}", params: params
  end

  describe 'basic fetch' do
    let!(:registration_to_cp) { create(:registration_to_cp) }

    it 'works' do
      expect(RegistrationToCpResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('registration_to_cps')
      expect(d.id).to eq(registration_to_cp.id)
    end
  end
end
