require 'rails_helper'

RSpec.describe "patient_identifiers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/patient_identifiers/#{patient_identifier.id}", payload
  end

  describe 'basic update' do
    let!(:patient_identifier) { create(:patient_identifier) }

    let(:payload) do
      {
        data: {
          id: patient_identifier.id.to_s,
          type: 'patient_identifiers',
          attributes: {
            identifier: 'jksdhjkfsd'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(PatientIdentifierResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { patient_identifier.reload.attributes }
    end
  end
end
