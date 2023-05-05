require 'rails_helper'

RSpec.describe ConsentQuestionnaireQuestion, :type => :model do
  describe "Validates presence of" do
    let(:consent_questionnaire_question) { build(:consent_questionnaire_question, :question_1) }
    [:position, :question].each do |field|
      it "#{field.to_s}" do
        consent_questionnaire_question.public_send("#{field}=", nil)

        expect(consent_questionnaire_question).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:consent_questionnaire_question, :question_1, :disabled)
    end

    it "is not normally visible" do
      expect(ConsentQuestionnaireQuestion.all).to be_empty
    end
  end

  describe "is closed" do
    let(:consent_questionnaire_question) { create(:consent_questionnaire_question, :question_1, :closed) }

    it "is not possible to update" do
      consent_questionnaire_question.question = "bar"
      expect(consent_questionnaire_question).to_not be_valid
      expect(consent_questionnaire_question.errors).not_to be_empty
      expect(consent_questionnaire_question.errors.where(:base).first.full_message).to eq("Consent question is closed. It cannot be updated")      
    end
  end
end