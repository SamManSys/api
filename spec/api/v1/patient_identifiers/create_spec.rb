require 'rails_helper'

RSpec.describe "patient_identifiers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/patient_identifiers", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:patient_identifier)
    end
    let(:patient) do
      create(:patient)
    end
    let(:payload) do
      {
        data: {
          type: 'patient_identifiers',
          attributes: params,
          relationships: {
            patient: {
              data: {
                type: 'patients',
                id: patient.id.to_s
              }
            }
          }

        }
      }
    end

    it 'works' do
      expect(PatientIdentifierResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { PatientIdentifier.count }.by(1)
    end
  end
end
