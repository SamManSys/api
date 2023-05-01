require 'rails_helper'

RSpec.describe Shipment, :type => :model do
  describe "Validates presence of" do
    let(:shipment) { build(:shipment) }
    [:date, :name].each do |field|
      it "#{field.to_s}" do
        shipment.public_send("#{field}=", nil)

        expect(shipment).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:shipment, :disabled)
    end

    it "is not normally visible" do
      expect(Shipment.all).to be_empty
    end
  end

  describe "is closed" do
    let(:shipment) { create(:shipment, :closed) }

    it "is not possible to update" do
      shipment.name = "bar"
      expect(shipment).to_not be_valid
      expect(shipment.errors).not_to be_empty
      expect(shipment.errors.where(:base).first.full_message).to eq("Shipment is closed. It cannot be updated")      
    end
  end
end