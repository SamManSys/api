FactoryBot.define do
  factory :shipment_sample do
    association :shipment
    association :sample
  end
end