require 'rails_helper'

RSpec.describe "consent_questionnaire_templates#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/consent_questionnaire_templates/#{consent_questionnaire_template.id}"
  end

  describe 'basic destroy' do
    let!(:consent_questionnaire_template) { create(:consent_questionnaire_template) }

    it 'updates the resource' do
      expect(ConsentQuestionnaireTemplateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ConsentQuestionnaireTemplate.count }.by(-1)
      expect { consent_questionnaire_template.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
