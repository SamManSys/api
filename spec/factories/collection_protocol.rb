FactoryBot.define do
  factory :collection_protocol do
    start_date { Date.today }
    sequence(:short_protocol_name) { |n| "SPN:#{n}" }    
    status { :active }
    
    trait :closed do
      status { :closed }
    end

    trait :disabled do
      status { :disabled }
    end
  end
end