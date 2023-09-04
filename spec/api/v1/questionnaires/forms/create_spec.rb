require 'rails_helper'

describe "questionnaires_forms#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/questionnaires_forms", payload
  end

  describe 'basic create' do
    let(:registration_to_cp) {
      create(:registration_to_cp)
    }

    let(:params) do
      attributes_for(:questionnaires_form)
    end
    let(:payload) do
      {
        data: {
          type: 'questionnaires_forms',
          attributes: params,
          relationships: {
            registration_to_cp: {
              data: {
                type: 'registration_to_cps',
                id: registration_to_cp.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(QuestionnairesFormResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { QuestionnairesForm.count }.by(1)
    end
  end
end

