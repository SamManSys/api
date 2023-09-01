FactoryBot.define do
  factory :stores_container do
    sequence(:name) { |n| "Container: #{n}"}

    size_x { 1 }
    size_y { 1 }

    association :stores_template
  end
end