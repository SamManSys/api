require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "forms#index", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires/forms", params: params
    end

    describe 'basic fetch' do
      let!(:completed_consent_questionnaire1) { create(:completed_consent_questionnaire) }
      let!(:completed_consent_questionnaire2) { create(:completed_consent_questionnaire) }

      it 'works' do
        expect(Questionnaires::FormResource).to receive(:all).and_call_original
        make_request
        expect(response.status).to eq(200), response.body
        expect(d.map(&:jsonapi_type).uniq).to match_array(['forms'])
        expect(d.map(&:id)).to match_array([completed_consent_questionnaire1.id, completed_consent_questionnaire2.id])
      end
    end
  end
end
