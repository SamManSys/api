require 'rails_helper'

RSpec.describe "patients#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/patients/#{patient.id}"
  end

  describe 'basic destroy' do
    let!(:patient) { create(:patient) }

    it 'updates the resource' do
      expect(PatientResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Patient.count }.by(-1)
      expect { patient.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
