FactoryBot.define do
  factory :storage_container do
    sequence(:name) { |n| "Container: #{n}"}

    size_x { 1 }
    size_y { 1 }

    association :storage_container_template
  end
end