FactoryBot.define do
  factory :stores_container do
    sequence(:name) { |n| "Container: #{n}"}

    size_x { 1 }
    size_y { 1 }

    association :stores_template

    trait :four_by_four do
      size_x { 4 }
      size_y { 4 }  
    end

    trait :ten_by_ten do
      size_x { 10 }
      size_y { 10 }
    end
  end
end