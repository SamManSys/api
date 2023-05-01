FactoryBot.define do
  factory :shipment do
    sequence(:name) { |n| "shipment_#{n}"}
    date { Date.today }

    status { :active }

    trait :closed do
      status { :closed }
    end

    trait :disabled do
      status { :disabled }
    end
  end
end

