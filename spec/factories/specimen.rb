FactoryBot.define do
  factory :specimen do
    sequence(:label) { |n| "ZZ#{n}" }
    sequence(:barcode) { |n| "#{n}" }
    availability { 'available' }
    status { :active }

    association :specimen_collection
    
    trait :closed do
      status { :closed }
    end

    trait :disabled do
      status { :disabled }
    end
    
    trait :unavailable do
      availability { 'not_available' }
    end

    trait :tissue do
      specimen_class { "Fresh" }
      specimen_type  { "Tissue" }
    end

    trait :fluid do
      specimen_class { "Fluid" }
      specimen_type  { "Blood" }
    end
  end
end
