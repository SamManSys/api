require 'rails_helper'

RSpec.describe "registration_to_cps#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/registration_to_cps/#{registration_to_cp.id}"
  end

  describe 'basic destroy' do
    let!(:registration_to_cp) { create(:registration_to_cp) }

    it 'updates the resource' do
      expect(RegistrationToCpResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { RegistrationToCp.count }.by(-1)
      expect { registration_to_cp.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
