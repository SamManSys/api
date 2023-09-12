require 'rails_helper'

RSpec.describe SampleCollection, :type => :model do
  describe "Validates presence of" do
    let(:sample_collection) { build(:sample_collection) }
    [:study_point_name].each do |field|
      it "#{field.to_s}" do
        sample_collection.public_send("#{field}=", nil)

        expect(sample_collection).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:sample_collection, :disabled)
    end

    it "is not normally visible" do
      expect(SampleCollection.all).to be_empty
    end
  end

  describe "is closed" do
    let(:sample_collection) { create(:sample_collection, :closed) }

    it "is not possible to update" do
      sample_collection.study_point_name = "bar"
      expect(sample_collection.save).to be_falsey
      expect(sample_collection.errors).not_to be_empty
      expect(sample_collection.errors.where(:base).first.full_message).to eq("Sample collection is closed. It cannot be updated")      
    end
  end
end