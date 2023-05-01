require 'rails_helper'

RSpec.describe "patient_identifiers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/patient_identifiers/#{patient_identifier.id}"
  end

  describe 'basic destroy' do
    let!(:patient_identifier) { create(:patient_identifier) }

    it 'updates the resource' do
      expect(PatientIdentifierResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { PatientIdentifier.count }.by(-1)
      expect { patient_identifier.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
