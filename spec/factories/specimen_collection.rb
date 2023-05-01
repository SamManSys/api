FactoryBot.define do
  factory :specimen_collection do |f|
    sequence(:study_point_name) { |n| "SC Study point: #{n}" }

    trait :closed do
      status { :closed }
    end

    trait :disabled do
      status { :disabled }
    end
  end
end
