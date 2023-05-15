require 'rails_helper'

RSpec.describe "active_consent_questionnaire_templates#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/active_consent_questionnaire_templates", payload
  end

  describe 'basic create' do
    let(:collection_protocol) do
      create(:collection_protocol)
    end

    let(:consent_questionnaire_template) do
      create(:consent_questionnaire_template)
    end

    let(:params) do
      attributes_for(:active_consent_questionnaire_template)
    end

    let(:payload) do
      {
        data: {
          type: 'active_consent_questionnaire_templates',
          attributes: params,
          relationships: {
            collection_protocol: {
              data: {
                type: 'collection_protocols',
                id: collection_protocol.id.to_s
              }
            },
            consent_questionnaire_template: {
              data: {
                type: 'consent_questionnaire_templates',
                id: consent_questionnaire_template.id.to_s
              }
            }
          }
            
        }
      }
    end

    it 'works' do
      expect(ActiveConsentQuestionnaireTemplateResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ActiveConsentQuestionnaireTemplate.count }.by(1)
    end
  end
end
