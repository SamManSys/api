FactoryBot.define do
  factory :sample do
    sequence(:label) { |n| "ZZ#{n}" }
    sequence(:barcode) { |n| "#{n}" }
    availability { 'available' }
    status { :active }

    association :sample_collection
    
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
      sample_class { "Fresh" }
      sample_type  { "Tissue" }
    end

    trait :fluid do
      sample_class { "Fluid" }
      sample_type  { "Blood" }
    end
  end
end
