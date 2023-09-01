FactoryBot.define do
  factory :sample_collection do |f|
    sequence(:study_point_name) { |n| "SC Study point: #{n}" }
    status { :active }

    trait :closed do
      status { :closed }
    end

    trait :disabled do
      status { :disabled }
    end
  end
end
