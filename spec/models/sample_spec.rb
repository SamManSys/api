require 'rails_helper'

RSpec.describe Sample, :type => :model do
  describe "Validates presence of" do
    let(:sample) { build(:sample, :tissue) }
    [:label, :barcode].each do |field|
      it "#{field.to_s}" do
        sample.public_send("#{field}=", nil)

        expect(sample).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:sample, :tissue, :disabled)
    end

    it "is not normally visible" do
      expect(Sample.all).to be_empty
    end
  end

  describe "is closed" do
    let(:sample) { create(:sample, :tissue, :closed) }

    it "is not possible to update" do
      sample.label = "bar"
      expect(sample).to_not be_valid
      expect(sample.errors).not_to be_empty
      expect(sample.errors.where(:base).first.full_message).to eq("Sample is closed. It cannot be updated")      
    end
  end
end