require 'rails_helper'

RSpec.describe "patient_identifiers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/patient_identifiers", params: params
  end

  describe 'basic fetch' do
    let!(:patient_identifier1) { create(:patient_identifier) }
    let!(:patient_identifier2) { create(:patient_identifier) }

    it 'works' do
      expect(PatientIdentifierResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['patient_identifiers'])
      expect(d.map(&:id)).to match_array([patient_identifier1.id, patient_identifier2.id])
    end
  end
end
