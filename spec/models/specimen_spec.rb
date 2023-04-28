require 'rails_helper'

RSpec.describe Specimen, :type => :model do
  describe "Validates presence of" do
    let(:specimen) { build(:specimen, :tissue) }
    [:label, :barcode].each do |field|
      it "#{field.to_s}" do
        specimen.public_send("#{field}=", nil)

        expect(specimen).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:specimen, :tissue, :disabled)
    end

    it "is not normally visible" do
      expect(Specimen.all).to be_empty
    end
  end

  describe "is closed" do
    let(:specimen) { create(:specimen, :tissue, :closed) }

    it "is not possible to update" do
      specimen.label = "bar"
      expect(specimen).to_not be_valid
      expect(specimen.errors).not_to be_empty
      expect(specimen.errors.where(:base).first.full_message).to eq("Specimen is closed.  Cannot be updated")      
    end
  end
end