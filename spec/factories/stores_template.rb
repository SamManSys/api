FactoryBot.define do
  factory :stores_template do
    sequence(:name) { |n| "Container: #{n}"}
    
    label_x { "X" }
    label_y { "Y" }
    size_x { 1 }
    size_y { 1 }

    trait :four_by_four do
      size_x { 4 }
      size_y { 4 }  
    end
  end
end