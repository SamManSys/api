require 'rails_helper'

RSpec.describe "patients#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/patients/#{patient.id}", params: params
  end

  describe 'basic fetch' do
    let!(:patient) { create(:patient) }

    it 'works' do
      expect(PatientResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('patients')
      expect(d.id).to eq(patient.id)
    end
  end
end
