require 'rails_helper'

RSpec.describe SpecimenCollection, :type => :model do
  describe "Validates presence of" do
    let(:specimen_collection) { build(:specimen_collection) }
    [:study_point_name].each do |field|
      it "#{field.to_s}" do
        specimen_collection.public_send("#{field}=", nil)

        expect(specimen_collection).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:specimen_collection, :disabled)
    end

    it "is not normally visible" do
      expect(SpecimenCollection.all).to be_empty
    end
  end

  describe "is closed" do
    let(:specimen_collection) { create(:specimen_collection, :closed) }

    it "is not possible to update" do
      specimen_collection.study_point_name = "bar"
      expect(specimen_collection).to_not be_valid
      expect(specimen_collection.errors).not_to be_empty
      expect(specimen_collection.errors.where(:base).first.full_message).to eq("Specimen collection is closed. It cannot be updated")      
    end
  end
end