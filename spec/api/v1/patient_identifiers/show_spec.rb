require 'rails_helper'

RSpec.describe "patient_identifiers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/patient_identifiers/#{patient_identifier.id}", params: params
  end

  describe 'basic fetch' do
    let!(:patient_identifier) { create(:patient_identifier) }

    it 'works' do
      expect(PatientIdentifierResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('patient_identifiers')
      expect(d.id).to eq(patient_identifier.id)
    end
  end
end
