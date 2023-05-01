require 'rails_helper'

RSpec.describe PatientIdentifier, :type => :model do
  describe "Validates presence of" do
    let(:patient_identifier) { build(:patient_identifier) }
    [:identifier, :identifier_type].each do |field|
      it "#{field.to_s}" do
      patient_identifier.public_send("#{field}=", nil)

        expect(patient_identifier).not_to be_valid
      end
    end
  end
end