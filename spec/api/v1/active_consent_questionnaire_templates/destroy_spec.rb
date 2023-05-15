require 'rails_helper'

RSpec.describe "active_consent_questionnaire_templates#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/active_consent_questionnaire_templates/#{active_consent_questionnaire_template.id}"
  end

  describe 'basic destroy' do
    let!(:active_consent_questionnaire_template) { create(:active_consent_questionnaire_template) }

    it 'updates the resource' do
      expect(ActiveConsentQuestionnaireTemplateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ActiveConsentQuestionnaireTemplate.count }.by(-1)
      expect { active_consent_questionnaire_template.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
