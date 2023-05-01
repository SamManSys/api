require 'rails_helper'

RSpec.describe "registration_to_cps#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/registration_to_cps", params: params
  end

  describe 'basic fetch' do
    let!(:registration_to_cp1) { create(:registration_to_cp) }
    let!(:registration_to_cp2) { create(:registration_to_cp) }

    it 'works' do
      expect(RegistrationToCpResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['registration_to_cps'])
      expect(d.map(&:id)).to match_array([registration_to_cp1.id, registration_to_cp2.id])
    end
  end
end
