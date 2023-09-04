require 'rails_helper'

RSpec.describe QuestionnairesQuestion, :type => :model do
  describe "Validates presence of" do
    let(:questionnaires_question) { build(:questionnaires_question, :question_1) }
    [:position, :question].each do |field|
      it "#{field.to_s}" do
        questionnaires_question.public_send("#{field}=", nil)

        expect(questionnaires_question).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:questionnaires_question, :question_1, :disabled)
    end

    it "is not normally visible" do
      expect(QuestionnairesQuestion.all).to be_empty
    end
  end

  describe "is closed" do
    let(:questionnaires_question) { create(:questionnaires_question, :question_1, :closed) }

    it "is not possible to update" do
      questionnaires_question.question = "bar"
      expect(questionnaires_question).to_not be_valid
      expect(questionnaires_question.errors).not_to be_empty
      expect(questionnaires_question.errors.where(:base).first.full_message).to eq("Questionnaires question is closed. It cannot be updated")      
    end
  end
end