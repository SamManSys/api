require 'rails_helper'

RSpec.describe RegistrationToCp, :type => :model do
  describe "Validates presence of" do
    let(:registration_to_cp) { build(:registration_to_cp) }
    [:date, :registration_identifier].each do |field|
      it "#{field.to_s}" do
        registration_to_cp.public_send("#{field}=", nil)

        expect(registration_to_cp).not_to be_valid
      end
    end
  end
end