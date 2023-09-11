require 'rails_helper'

RSpec.describe QuestionnairesResponse, :type => :model do
  describe "Validates presence of" do
    let(:questionnaires_response) { build(:questionnaires_response) }
    [:answer].each do |field|
      it "#{field.to_s}" do
        questionnaires_response.public_send("#{field}=", nil)

        expect(questionnaires_response).not_to be_valid
      end
    end
  end
end