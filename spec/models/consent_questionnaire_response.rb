require 'rails_helper'

RSpec.describe ConsentQuestionnaireResponse, :type => :model do
  describe "Validates presence of" do
    let(:consent_questionnaire_response) { build(:consent_questionnaire_response) }
    [:answer].each do |field|
      it "#{field.to_s}" do
        consent_questionnaire_response.public_send("#{field}=", nil)

        expect(consent_questionnaire_response).not_to be_valid
      end
    end
  end
end