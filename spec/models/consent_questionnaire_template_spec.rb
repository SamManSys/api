require 'rails_helper'

RSpec.describe ConsentQuestionnaireTemplate, :type => :model do
  describe "Validates presence of" do
    let(:consent_questionnaire_template) { build(:consent_questionnaire_template) }
    [:name].each do |field|
      it "#{field.to_s}" do
        consent_questionnaire_template.public_send("#{field}=", nil)

        expect(consent_questionnaire_template).not_to be_valid
      end
    end
  end
end