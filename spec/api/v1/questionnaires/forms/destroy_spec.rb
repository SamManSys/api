require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "forms#destroy", type: :request do
    subject(:make_request) do
      jsonapi_delete "/api/v1/questionnaires/forms/#{completed_consent_questionnaire.id}"
    end

    describe 'basic destroy' do
      let!(:completed_consent_questionnaire) { create(:completed_consent_questionnaire) }

      it 'updates the resource' do
        expect(Questionnaires::FormResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { CompletedConsentQuestionnaire.count }.by(-1)
        expect { completed_consent_questionnaire.reload }
          .to raise_error(ActiveRecord::RecordNotFound)
        expect(json).to eq('meta' => {})
      end
    end
  end
end
