require 'rails_helper'

RSpec.describe QuestionnairesTemplate, :type => :model do
  describe "Validates presence of" do
    let(:questionnaires_template) { build(:questionnaires_template) }
    [:name].each do |field|
      it "#{field.to_s}" do
        questionnaires_template.public_send("#{field}=", nil)

        expect(questionnaires_template).not_to be_valid
      end
    end
  end
end