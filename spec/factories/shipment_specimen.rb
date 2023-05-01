FactoryBot.define do
  factory :shipment_specimen do
    association :shipment
    association :specimen
  end
end